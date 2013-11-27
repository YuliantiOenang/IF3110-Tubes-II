window.addEventListener('load', function() {
	var selectorder = document.getElementById('selectorder');
	var selectsort = document.getElementById('selectsort');
	selectorder.onchange = function() {
		if (selectorder.selectedIndex == 0) {
			if (selectsort.selectedIndex == 0) {
				window.location.href = window.location.pathname + '?kategori=' + gup('kategori') + '&order=nama&sort=asc';
			}
			else {
				window.location.href = window.location.pathname + '?kategori=' + gup('kategori') + '&order=nama&sort=desc';
			}
		}
		else {
			if (selectsort.selectedIndex == 0) {
				window.location.href = window.location.pathname + '?kategori=' + gup('kategori') + '&order=harga&sort=asc';
			}
			else {
				window.location.href = window.location.pathname +'?kategori=' + gup('kategori') + '&order=harga&sort=desc';
			}
		}
	};

	selectsort.onchange = function() {
		if (selectorder.selectedIndex == 0) {
			if (selectsort.selectedIndex == 0) {
				window.location.href = window.location.pathname + '?kategori=' + gup('kategori') + '&order=nama&sort=asc';
			}
			else {
				window.location.href = window.location.pathname + '?kategori=' + gup('kategori') + '&order=nama&sort=desc';
			}
		}
		else {
			if (selectsort.selectedIndex == 0) {
				window.location.href = window.location.pathname + '?kategori=' + gup('kategori') + '&order=harga&sort=asc';
			}
			else {
				window.location.href = window.location.pathname +'?kategori=' + gup('kategori') + '&order=harga&sort=desc';
			}
		}
	};

});

function gup( name )
{
  name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
  var regexS = "[\\?&]"+name+"=([^&#]*)";
  var regex = new RegExp( regexS );
  var results = regex.exec( window.location.href );
  if( results == null )
    return "";
  else
    return results[1];
}