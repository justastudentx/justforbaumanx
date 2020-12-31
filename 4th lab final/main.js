class ShoppingCard {
    constructor() {
        this._items = {};
        this._this = null;
    }

    add(name, price, count) {
        if (name in this._items && 
                this._items[name].price === price) {
            this._items[name].count += count;
        } else {
            this._items[name] = {price, count};
        }
    }

    remove(name) {
        if (name in this._items) {
            delete this._items[name];
        }
    }

    clear() {
        if (this._this !== null) {
            this._this.remove();
        }
    }

    render() {
        const table = document.createElement('table');
        table.classList.add('shoppping-card');

        const tableHead = document.createElement('thead');
        tableHead.appendChild(this.__createRow(['Название', 'Цена', 'Количество']));

        const tableBody = document.createElement('tbody');
        Object.keys(this._items).forEach(key => {
            tableBody.appendChild(this.__createRow([key, this._items[key].price, this._items[key].count]));
        });

        table.append(tableHead, tableBody);

        this._this = table;

        return table;
    }

    calculateSum() {
        let sum = 0;

        Object.keys(this._items).forEach(key => {
            sum += Number(this._items[key].price) * Number(this._items[key].count);
        });

        return sum;
    }

    __createRow(fields) {
        const row = document.createElement('tr');
        fields.forEach(element => {
            const column = document.createElement('td');
            column.innerHTML = element;
            row.appendChild(column);
        });

        return row;
    }
}

class TableAdder {
    constructor() {
        this._this = null;
        this._shoppingCard = new ShoppingCard();
    }

    render() {
        const alreadyUsed = {};
        const wrapper = document.createElement('div');

        const firstInputLabelWrapper = document.createElement('div');

        const firstInputLabel = document.createElement('label');
        firstInputLabel.innerHTML = 'Bведите название товара';
        const firstInput = document.createElement('input');

        firstInputLabelWrapper.append(firstInputLabel, firstInput);

        const secondInputLabelWrapper = document.createElement('div');

        const secondInputLabel = document.createElement('label');
        secondInputLabel.innerHTML = 'Bведите стоимость товара';
        const secondInput = document.createElement('input');

        secondInputLabelWrapper.append(secondInputLabel, secondInput);

        wrapper.append(firstInputLabelWrapper, secondInputLabelWrapper);

        const table = this.__createTable();
        
        const addingButton = document.createElement('button');
        addingButton.innerHTML = 'Добавить';
        addingButton.addEventListener('click', event => {
            if (firstInput.value in alreadyUsed && alreadyUsed[firstInput.value] === secondInput.value) {
                alert('Такое уже было');
                return;
            }
            if (firstInput.value === '' || secondInput.value === '') {
                alert('Поля не должны быть пустыми');
                return;
            }
            alreadyUsed[firstInput.value] = secondInput.value;

            const row = document.createElement('tr');
            const name = document.createElement('td');
            name.innerHTML = firstInput.value;
            const cost = document.createElement('td');
            cost.innerHTML = secondInput.value;
            const push = document.createElement('td');
            const button = document.createElement('button');
            button.innerHTML = 'Добавить';
            button.addEventListener('click', () => {
                this._shoppingCard.add(name.innerHTML, cost.innerHTML, 1);
                this._shoppingCard.clear();
                wrapper.append(this._shoppingCard.render());
            });

            push.appendChild(button);

            row.append(name, cost, push);

            const tableBody = table.getElementsByClassName('adding-table__body')[0];
            tableBody.appendChild(row);
        });
        
        const countButton = document.createElement('button');
        countButton.innerHTML = 'Посчитать';

        const countOutput = document.createElement('label');

        countButton.addEventListener('click', () => {
            countOutput.innerHTML = this._shoppingCard.calculateSum();
        });

        wrapper.append(addingButton, table, countButton, countOutput, this._shoppingCard.render());

        return wrapper;
    }

    __createInputWithLabel(name) {
        const inputLabelWrapper = document.createElement('div');

        const inputLabel = document.createElement('label');
        const input = document.createElement('input');

        inputLabelWrapper.append(inputLabel, input);

        return inputLabelWrapper;
    }

    __createTable() {
        const table = document.createElement('table');
        table.classList.add('adding-table');
        
        const tableHead = document.createElement('thead');
        const row = document.createElement('tr');

        const name = document.createElement('td');
        name.innerHTML = 'Название товара';

        const cost = document.createElement('td');
        cost.innerHTML = 'Цена товара';

        const push = document.createElement('td');
        push.innerHTML = 'Добавить в корзину';

        row.append(name, cost, push);
        tableHead.appendChild(row);

        const tableBody = document.createElement('tbody');
        tableBody.classList.add('adding-table__body');

        table.append(tableHead, tableBody);

        return table;
    }
}

const n = new TableAdder();
document.body.appendChild(n.render());