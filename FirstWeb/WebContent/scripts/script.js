function openPage(pageName, elmnt, color) {

    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }


    tablinks = document.getElementsByClassName("tablink");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.backgroundColor = "";
    }


    document.getElementById(pageName).style.display = "block";


    elmnt.style.backgroundColor = color;
}




function EditPerson(row,button) {
    var rows=document.getElementsByClassName("tablerow");

    if (button.disabled==true) {
        button.disabled = false;
    }

    for(var i=0;i<rows.length;i++){
        rows[i].style.backgroundColor="white";
    }
        row.style.backgroundColor="#a3a1a1";
}

function goToPage(url) {
    window.location.href=url;
}

function show(modal) {
	modal.style.display="block";
}