$(function(){
    $.ajax({
      url:"http://127.0.0.1:5500/header1.html",
      type:"get",
      success:function(res){
        // 动态加载样式
        $("<link rel='stylesheet' href='css/header1.css'>").appendTo("head");
        $(res).replaceAll("#header");
        function tan(hover,hover_a){
            $(hover).hide()
            $(hover_a).parent().mouseover(function(){$(hover).show()})
            .mouseout(function(){
            $(hover).hide();
            })
          }
          tan(".app",".load_app>a")
    }
    })
    
})