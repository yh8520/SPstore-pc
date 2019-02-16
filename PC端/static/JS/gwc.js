var cities=[
  [{"name":'东城区',"value":101},
   {"name":'西城区',"value":102},
   {"name":'海淀区',"value":103},
   {"name":'朝阳区',"value":104}],
  [{"name":'河东区',"value":201},
   {"name":'河西区',"value":202},
   {"name":'南开区',"value":203}],
  [{"name":'石家庄市',"value":301},
   {"name":'廊坊市',"value":302},
   {"name":'保定市',"value":303},
   {"name":'唐山市',"value":304},
   {"name":'秦皇岛市',"value":305}]
];
var selProvs=
document.querySelector("[name=provs]");
var selCts=
document.querySelector("[name=cities]");
selProvs.onchange=function(){
var i=this.selectedIndex-1;
if(i<0) selCts.className="hide";
else{
  var cts=cities[i];
  selCts.innerHTML="";
  var frag=
    document.createDocumentFragment();
  var opt=document.createElement("option");
  opt.innerHTML="-请选择-";
  frag.appendChild(opt);
  for(var i=0;i<cts.length;i++){
    var opt=document.createElement("option");
    opt.innerHTML=cts[i]["name"];
    opt.value=cts[i]["value"];
    frag.appendChild(opt);
  }
  selCts.appendChild(frag);
  selCts.className="";
}
}
var lid=sessionStorage.getItem("lid");
console.log(lid)
$(function(){
    $.ajax({
        url:"http://127.0.0.1:3000/cart/?lid="+lid,
        type:"get",
        dataType:"json"
    }).then(result=>{

    })
})