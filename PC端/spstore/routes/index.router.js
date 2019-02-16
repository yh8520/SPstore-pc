const express=require("express");
const pool=require("../pool");
const router=express.Router()
router.get("/index",(req,res)=>{
   var sql="select * from sp_index_carousel";
   pool.query(sql,(err,result)=>{
       if(err) throw err;
       res.writeHead(200,{
           "Access-Countrol-Allow-Origin":"*"
       })
       res.write(JSON.stringify(result))
       res.end();
   })
})

router.get("/product",(req,res)=>{
    var sql="select * from sp_index_product";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.writeHead(200,{
            "Access-Countrol-Allow-Origin":"*"
        })
        res.write(JSON.stringify(result))
        res.end();
    })
 })

 router.get("/super",(req,res)=>{
    // var sql="select s.title,s.bg,s.aattr,s.pic,s.img,i.md,p.href from sp_index_super s,sp_pic as i,sp_index_product as p where i.sp_id=p.pid and i.pid=s.lid";
    var spl="select * from sp_index_super";
    pool.query(spl,(err,result)=>{
        if(err) throw err;
        res.writeHead(200,{
            "Access-Countrol-Allow-Origin":"*"
        })
        res.write(JSON.stringify(result))
        res.end();
    })
 })

//  router.get("/goods",(req,res)=>{
//      var sql="select i.md,p.href from sp_pic as i,sp_index_product as p where i.pid=p.pid"
//      pool.query(sql,(err,result)=>{
//          if(err) throw err;
//          res.send(result);
//      })
//  })
module.exports=router;