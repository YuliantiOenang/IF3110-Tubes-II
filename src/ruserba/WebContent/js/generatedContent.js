var bookmark = new Array();
var GScroll = new Array();

var GName;
var GJenis;
var GURL;
var GsearchName,GsearchKateg,GsearchHarga,GsearchOP;

var CurPage;
var GJmlPage;

var str="";

if (window.XMLHttpRequest)
{// code for IE7+, Firefox, Chrome, Opera, Safari
	xmlhttp=new XMLHttpRequest();
}
else
{// code for IE6, IE5
	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
}

xmlhttp.onreadystatechange=function()
{
	if (xmlhttp.readyState==4 && xmlhttp.status==200)
	{
		var parsedData = JSON.parse(xmlhttp.responseText);		
		str = str+parsedData['content'];
		GPage = parsedData['pageOf'];
		GJmlPage = Math.floor(parsedData['jmlPage']);
		//berisi response str
		document.getElementById('ISI').innerHTML=str;
	}
};

function init(URL,name,jenis,searchName,searchKateg,searchHarga,searchOP)
{
	GName = name;
	GJenis = jenis;
	GURL = URL;
	GsearchName = searchName;
	GsearchKateg = searchKateg;
	GsearchHarga = searchHarga;
	GsearchOP = searchOP;
	
	CurPage=1;
	str="";
	var i;
	for (i=1;i<=100;i++)
	{
		bookmark[i] = false;
		GScroll[i] = (i-1) * 400;
	}
	xmlhttp.open("GET",GURL+"?page="+CurPage+"&sort="+GName+"&jenisSort="+GJenis+"&search="+GsearchName+"&kategori="+GsearchKateg+"&harga="+GsearchHarga+"&operator="+GsearchOP,true); //URL samain
	CurPage++;
	xmlhttp.send();
}

onscroll = function() {
  var nVScroll = document.documentElement.scrollTop || document.body.scrollTop;
 
  if ((!bookmark[CurPage]) && (nVScroll > GScroll[CurPage]))
  {
	//alert("Page :"+CurPage+" Scroll : "+GScroll[CurPage]);
	bookmark[CurPage] = true;
	setTimeout(function(){		
		xmlhttp.open("GET",GURL+"?page="+CurPage+"&sort="+GName+"&jenisSort="+GJenis+"&search="+GsearchName+"&kategori="+GsearchKateg+"&harga="+GsearchHarga+"&operator="+GsearchOP,true);
	 CurPage++;
	 xmlhttp.send();
	},2000);
  }
};