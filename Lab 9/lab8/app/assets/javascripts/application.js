// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks

handleAjaxSuccess = function(event) {
    [data, status, xhr] = event.detail;
    showResult(data);
}

document.addEventListener('DOMContentLoaded', function() {
    document.querySelector("#add").addEventListener(
    'ajax:success', handleAjaxSuccess)
})

function showResult(data)
{
    var table = document.getElementById("result");
    var tr = document.createElement("tr");

    if (Number(data.count) == 0)
    {
        var td = document.createElement("td");
        td.innerText = 'Нет чисел <= ' + document.getElementById("number").value;
        td.setAttribute("colspan", 4);
        tr.appendChild(td);
        table.appendChild(tr);
        return;
    }
    var td1 = document.createElement("td");
    var td2 = document.createElement("td");
    var td3 = document.createElement("td");
    var td4 = document.createElement("td");

    td1.innerText = document.getElementById("number").value;
    td2.innerText = data.array;
    td3.innerText = data.double_array;
    td4.innerText = data.count;

    tr.appendChild(td1);
    tr.appendChild(td2);
    tr.appendChild(td3);
    tr.appendChild(td4);
    table.appendChild(tr);
}