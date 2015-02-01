# $ -> #replaces document.ready
# 	# a = 1
# 	# b = 5 if a > 10

# 	# sayHello = -> 
# 	# 	alert "Hello"

# 	# sayHello()

# 	# capitalize = (word) ->
# 	# 	word.charAt(0).toUpperCase() + word.slice(1)

# 	# 	alert(capitalize("cal"))

# 	$('a').click ->
# 		$(@).html("TROLL BUTTON")
# 		false #prevents event from bubbling and prevents default behavior
 
# 	$('.btn').click ->
# 		$(@).removeClass('btn-primary').addClass('btn-danger')
# 		false

# 	$('.btn').click ->
# 		$(@).animate({
# 			width: "+=50",
# 			height: "+=15"
# 			fontSize: "+=60"
# 			})

#   #   function() {
#   #   var capitalize;
  
#   #   capitalize = function(string) {
#   #     return string.charAt(0).toUpperCase() + string.slice(1);
#   #   };
  
#   #   $(function() {
#   #     return $("#sentence").on("keyup", function() {
#   #       var word_array;
#   #       word_array = $(this).val().split(" ");
#   #       word_array = word_array.map(function(word) {
#   #         return capitalize(word);
#   #       });
#   #       return $("#shuffled").text(word_array.join(" "));
#   #     });
#   #   });
  
#   # }).call(this);

  
# # take a field input and display its content in a div below it and cap each word's first letter
#   capitalize = (word) ->
#     word.charAt(0).toUpperCase() + word.slice(1)


#   $('.cap-each-word').keyup ->
#     wordArray = $(@).val().split(" ")
#     result    = wordArray.map (word) -> capitalize(word)
#     $(".cap-each-word-outcome").html result.join(" ") #convery array of words into string

  




# # (function() {
# #   $(function() {
# #     var a, b, capitalize, sayHello;
# #     a = 1;
# #     if (a > 10) {
# #       b = 5;
# #     }
# #     sayHello = function() {
# #       return alert("Hello");
# #     };
# #     sayHello();
# #     capitalize = function(word) {
# #       return word.charAt(0).toUpperCase() + word.slice(1);
# #     };
# #     alert(capitalize("cal"));
# #     return $('a').click(function() {
# #       $(this).html("HAHAHA");
# #       return false;
# #     });
# #   });

# # }).call(this);