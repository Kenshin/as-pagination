##Pagination Actionscript 3.0 Library
基于ActionScript 3.0的分页逻辑

### 使用方法：  
引入：  
<pre>
add page4as3lib-1.0.swc to libs folder
</pre>
或者：  
<pre>
add com\ksria\as3\pagination\ to src folder
</pre>

使用：  
<pre>
import com.ksria.as3.pagination.core.Pagination;
import com.ksria.as3.pagination.vo.PaginationVO;

total      : 总数
page       : 当前页
pagesize   : 每页包含的内容
offset     : 偏移量（例如1 2 3 4 5 6，点击6时，产生4 5 6 7 8 9，而非 7 8 9 10 11 12）
length     : 例如 上一页 2 3 4 5 6 下一页，则步长为5

var pv : PaginationVO  = Pagination.build( total, page, pagesize, offset, length );
</pre>

计算后结果：  
<pre>
pv.total      //总数
pv.page       //当前页
pv.pagesize   //每页的内容数
pv.lastpage   //最后一页
pv.loopcount  //共计多少分页
pv.previous   //前一页
pv.next       //后一页
pv.isprevious //是否显示前一页
pv.isnext     //是否显示后一页
pv.begin      //开始
pv.end        //结束
pv.length     //原始的步长（即传入的参数，也是begin -> end时的步长）
pv.step       //步长（真实的步长）
pv.isforward  //是否可以前进，指&quot;&gt;&gt;&quot;
pv.isback     //是否可以后退，指&quot;&lt;&lt;&quot;
pv.forward    //前进到第几页
pv.back       //后退到第几页
pv.offset     //偏移量
</pre>

## 其他版本的分页组件：  
Node.js  版：[https://github.com/kenshin/node-pagination](https://github.com/kenshin/node-pagination)
Javascrip版：[https://github.com/kenshin/js-pagination](https://github.com/kenshin/js-pagination)

## 更新日志：
version 1.0 [2011-01-08]
* 适合任意Flash Player 10.x+
* 支持复杂分页

## 联系方式：
* 博客：[k-zone.cn](http://www.k-zone.cn/zblog)
* 微博：[新浪微博](http://weibo.com/23784148)
* 联络：kenshin[AT]ksria.com

## 版权和许可：
Copyright 2012 [k-zone.cn](http://www.k-zone.cn/zblog)  
Licensed under MIT or GPL Version 2 licenses
