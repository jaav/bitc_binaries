$(function() {
	$('#buy_bcard').click(function(ev){
		ev.preventDefault();
		$.ajax({
			url:'/bitc/front/ajax/addToBasket.do?catalogProductId=206',
			type:'GET',
			dataType: "json",
			success : function(data){
				location.href = '/bitc/front/eshop/displayBasket.do';
			}
		});
	});
});