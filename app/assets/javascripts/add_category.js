$(document).ready(function(){
  Caps.check_disable_category = function(category_element){
    var selected_categories = $('#profile_categories').val().split(', ');
    $.each(selected_categories, function(index, value){
      if (category_element.text() == value) {
        category_element.addClass('disabled');
      }
    });
  }
  
  Caps.strip_commas = function(string_value){
    string_value = string_value.replace("Unknown", '');
    return string_value.replace(/^,\s|, $/g, '');
  }
    
  //change the text that preceeds the selectable categories
  $('#category_picker_text').text('Click the buttons below to add or remove a category or add a new category above.');
  
  $('#current_categories .category').each(function(index){
    var category = $(this).text();
    $(this).addClass('btn btn-mini btn-success');  
    Caps.check_disable_category($(this));
  });   
  
  $('#current_categories .category').click(function(){  
    var category = $(this).text();
    if ($(this).hasClass('disabled')) {
      var current_value = $('#profile_categories').val();
      
      var category_with_comma = category + ', ';
      if (current_value.indexOf(category_with_comma) != -1){
        var new_value = current_value.replace(category_with_comma, '');
      } else {
        var new_value = current_value.replace(category, '');
      } 
      $(this).removeClass('disabled');
    } else {
      $(this).addClass('disabled');
      var current_value = $('#profile_categories').val();
      var new_value = current_value + ', ' + category;           
    }
    new_value = Caps.strip_commas(new_value);    
    $('#profile_categories').val(new_value); 
    return false;
  });  
  
});