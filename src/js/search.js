window.addEventListener('load', function() {
	var searchform = document.getElementById('searchform');
	var searchinput = document.getElementById('searchinput').value;
        var searchpilihan = document.getElementById('pilihan').value;
	var searchbutton = document.getElementById('searchbutton');

	searchbutton.onclick = function () {
            searchform.onsubmit();
	};

	searchform.onsubmit = function() {
            window.location.href = 'search.jsp?kata=' + searchinput + '&pilihan=' + searchpilihan;
            return false;
	}
        
        searchpilihan.onchange = function () {
            if (searchpilihan.selectedIndex == 0) {
                    window.location.href = 'search.jsp?kata=' + searchinput + '&pilihan=nama';
            }
            else {
                    window.location.href = 'search.jsp?kata=' + searchinput + '&pilihan=kategori';
            }
        }
});