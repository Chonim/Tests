<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class=''>
<head><meta charset='UTF-8'><meta name="robots" content="noindex">
<link rel="canonical" href="http://codepen.io/tayfunerbilen/pen/rIHvD/" />

<link rel='stylesheet prefetch' href='//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>
<style class="cp-pen-styles"></style></head><body>
<div class="arama">
    <form action="" onsubmit="return false">
        <h2>Youtube API jQuery AutoComplete</h2>
        <div class="ui-widget">
            <label for="youtube">Youtube Arama: </label>
            <input id="yo" />
            <button id="submit">ARA</button>
        </div>
    </form>
</div>

<div id="sonuc"></div>
	<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src='//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
<script>
$('#yo').autocomplete({
    source: function (request, response) {
        var apiKey = 'AI39si7ZLU83bKtKd4MrdzqcjTVI3DK9FvwJR6a4kB_SW_Dbuskit-mEYqskkSsFLxN5DiG1OBzdHzYfW0zXWjxirQKyxJfdkg';
        var query = request.term;
        $.ajax({
            url: 'http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=' + query + '&key=' + apiKey + '&format=5&alt=json&callback=?',
            dataType: 'jsonp',
            success: function (data, textStatus, request) {
                response($.map(data[1], function (item) {
                    return {
                        label: item[0],
                        value: item[0]
                    };
                }));
            }
        });
    },
    select: function (event, ui) {
        $.youtubeAPI(ui.item.label);
    }
});
//# sourceURL=pen.js
</script>
</body></html>