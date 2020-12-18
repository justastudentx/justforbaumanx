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
    if (document.getElementsByName("transformer")[0].checked)
        table.appendChild(data.getElementsByTagName("tr")[0]);
    else
    {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', 'transformer.xslt', false);
        xhr.send();
        
        if (xhr.status == 200)
        {
            transformer = xhr.responseXML;
            processor = new XSLTProcessor();
            processor.importStylesheet(transformer);
            resultDocument = processor.transformToFragment(data, document);
            table.appendChild(resultDocument.children[1].getElementsByTagName("tr")[0]);
        }
        else
            alert("Произошла ошибка!")
    }
}