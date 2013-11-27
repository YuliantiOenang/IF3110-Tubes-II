/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function delete_item(id) {
    
    var popup = document.getElementById("popup");
    popup.style.visibility = 'visible';
    
    var id_popup = document.getElementById("id_popup");
    id_popup.value = id;
    
    
}

function closePopup() {
    var popup = document.getElementById("popup");
    popup.style.visibility='hidden';
}
