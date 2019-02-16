const express=require("express");
const pool=require("../pool");
const router=express.Router();
router.get("/sales",(req,res)=>{
  var sql="select * from sp_inputText order by id asc";
  pool.query(sql,(err,result)=>{
      if(err) throw err;
      res.send(result)
  })
})

// router.get("/sales1",(req,res)=>{
//     var name=req.query.name;
//     var sql="insert into sp_inputText VALUES(null,?)";
//     pool.query(sql,[name],(err,result)=>{
//         if(err) throw err;
//         if(result.affectedRows>0){
//             res.send(result)
//           }else{
//             res.send({code:-1});
//           }
//     })
// })

router.get("/keyword",(req,res)=>{
    var keyword=req.query.keyword;
    var pno=req.query.pno;
    if(pno===undefined) pno=0;
    var sql=`select * ,(select md from sp_pic where sp_id=lid limit 1) as md from sp_pro where title like '%${keyword}%' or brand like '%${keyword}%'`;
    pool.query(sql,[keyword],(err,result)=>{
      if(err) console.log(err);
      var count=result.length;
      var pageCount=Math.ceil(count/12)
      var products=result.slice(pno*12,pno*12+12)
      var output={pno,count,pageCount,products}
      res.send(output);
    })
  })
  

// router.get("/keyword",(req,res)=>{
//     var keyword=req.query.keyword;
//     var sql=`select * ,(select md from sp_pic where sp_id=lid limit 1) as md from sp_pro where title like '%${keyword}%' or brand like '%${keyword}%'`;
//     pool.query(sql,[keyword],(err,result)=>{
//         if(err) throw err;
//         res.send(result)
//     })
// })
module.exports=router;