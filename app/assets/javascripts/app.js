$( document ).ready(function() {

function myFunction() {
      alert("Are you sure you want to permanently delete your profile?");
  };

 $('#field').keyup(function () {
  var min = 3000;
  var len = $(this).val().length;
  var char = min - len;
  $('#charNum').text(char + ' characters left until minimum reached');
  });


 // $('#user-rev').on("click", function(event){
 //    event.preventDefault();
 //    url = $(event.target).attr("href")
 //    $.ajax({
 //        method: 'GET',
 //        url: url
 //      }).done(function(response){
 //        $(".container").hide(".nav-bar");
 //        $("#user-rev").append(response);
 //      });
 //  });

});