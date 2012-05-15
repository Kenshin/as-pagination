package com.ksria.as3.pagination.core 
{
	import com.ksria.as3.pagination.vo.PageVO;
	import com.ksria.as3.pagination.vo.PaginationVO;
	
	/**
	 * 用来计算分页相关内容的类
	 * 
	 * @author Kenshin
	 */
	public class Pagination 
	{
		/**
		 * 保存上一页，用来判断是前进还是后退
		 * 
		 * @private
		 */
		private static var oldpage : int = -1;
		
		/**
		 *  Constructor. 
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4.6
		 */
		public function Pagination() 
		{
			//TO DO
		}
		
		/**
		* 用来计算分页，使用方法：
		* Pagination.build( total, page, pagesize, offset, length );
		* 
		* @param total      总数
		* @param page       当前页
		* @param pagesize   每页包含的内容
		* @param offset     偏移量（例如1 2 3 4 5 6，点击6时，产生4 5 6 7 8 9，而非 7 8 9 10 11 12）
		* @param length     步长
		* 
		* @return PaginationVO
		* 
		* @langversion 3.0
		* @playerversion Flash 10
		* @playerversion AIR 1.5
		* @productversion Flex 4.6
		* 
		*/
		public static function build( total : int, page : int, pagesize : int, offset : int, length : int ) : PaginationVO {
			
			if ( total    <= 0 ) throw Error( "total表示为分页的总数，因此只能为正整数。" );
			if ( page     <= 0 ) throw Error( "page表示为当前页，因此只能为正整数。" );
			if ( pagesize <= 0 ) throw Error( "pagesize表示为每页的内容数，因此只能是正整数。" );
			if ( offset   <  0 ) throw Error( "offset表示为偏移量，因此只能为正整数" );
			if ( length   <= 0 ) throw Error( "length表示为步长，因此只能为正整数" );
			
			//最后一页
			//计算方法：最大文章数 / 每页文章数
			var lastpage : int   = Math.ceil( total / pagesize );

			if ( page > lastpage ) throw Error( "当前页数（page）不能超过分页总数（lastpage）。" );
			
			//共有多少个分页
			var loopcount : int  = Math.ceil( lastpage / pagesize );
			
			//重新计算
			page = page    > lastpage ? 1 : page;
			
			//前一页、后一页
			var previous : int   = page - 1;
			var next : int       = page + 1;
			
			//是否显示前一页/后一页
			var isPrevious : Boolean, isNext : Boolean;
			isNext     = next - 1             < lastpage ? true : false;
			isPrevious = previous             > 0        ? true : false;

			//开始 结束 步长
			var begin : int, end : int, step : int;
			//计算步长
			step       = lastpage >  length         ? length       : lastpage;
			//计算开始
			//1 2 3 4 5 6
			//点击6时，产生4 5 6 7 8 9
			//而非 7 8 9 10 11 12
			//if ( lastpage - page < step ) {
			//	begin  = lastpage - step + 1;
			//}
			//else 
			if ( offset > 0 ) {
				begin  = page     <= offset       ? 1            : page - offset;
			}
			else if ( offset == 0 && page == 1 ) {
				begin  = 1;
			}
			else if ( page != 1 && Pagination.oldpage < page ) {
				begin  = page     < pagesize        ? 1            : page;
			}
			else if ( page != 1 && Pagination.oldpage >= page ) {
				begin  = page     < pagesize        ? 1            : page - step + 1;
			}
			//计算结束
			end        = begin    +  step;
			//如果end比lastpage大的话，赋值为lastpage
			end        = end      >= lastpage       ? lastpage + 1 : end;
			
			if ( end - begin + 1 != step ) {
				end = begin + step;
			}
			if ( begin + step - 1 > lastpage ) {
				begin = lastpage - step + 1;
				end   = lastpage + 1;
			}
			
			//前滚、后滚
			//是否显示>> and <<
			var isForward : Boolean, isBack : Boolean;
			isForward = lastpage - end >= 1         ? true         : false;
			isBack    = begin          >  1         ? true         : false;
			
			//前进/后退到第几页
			var forward : int, back : int;
			back      = begin - 1      <= 0         ? 1            : begin - 1;
			forward   = end;
			
			//当前的page数组
			var i : int;
			var arr : Array = [];
			for ( i = begin; i < end; i++ ) {
				var tmp : PageVO = new PageVO();
				tmp.page = i;
				if ( i == page ) tmp.curpage = i;
				else             tmp.curpage = -1;
				arr.push( tmp );
			}
			
			//总长度
			var totalarr : Array = [];
			for ( i = 1; i <= lastpage; i++ ) {
				totalarr.push( i );
			}
			
			//////////////////////////////////////////////////////
			//////////////////////////////////////////////////////
			
			trace( "Pagination.oldpage= " + Pagination.oldpage );
			//backup page
			Pagination.oldpage = page;
			
			var pv : PaginationVO = new PaginationVO();
			//总数
			pv.total     = total;
			//当前页
			pv.page      = page;
			//每页的内容数
			pv.pagesize  = pagesize;
			//最后一页
			pv.lastpage  = lastpage;
			//共计多少分页
			pv.loopcount = loopcount;
			//前一页
			pv.previous  = previous;
			//后一页
			pv.next      = next;
			//是否显示前一页
			pv.isPrevious = isPrevious;
			//是否显示后一页
			pv.isNext     = isNext;
			//开始
			pv.begin    = begin;
			//结束
			pv.end      = end;
			//步长
			pv.step     = step;
			//前滚
			pv.isForward  = isForward;
			//后滚
			pv.isBack     = isBack;
			//前进的页数
			pv.forward    = forward;
			//后退的页数
			pv.back       = back;
			//偏移量
			pv.offset     = offset;
			//begin -> end 时的步长
			pv.length     = length;
			//page list
			pv.pagelist.source  = arr;
			//total page list
			pv.totallist.source = totalarr;
			
			trace( "================================" );
			trace( "pv.page           = " + pv.page );
			trace( "pv.total          = " + pv.total );
			trace( "pv.loopcount      = " + pv.loopcount );
			trace( "pv.pagesize       = " + pv.pagesize );
			trace( "pv.lastpage       = " + pv.lastpage );
			trace( "pv.begin          = " + pv.begin );
			trace( "pv.setp           = " + step );
			trace( "pv.end            = " + pv.end );
			trace( "pv.previous       = " + pv.previous );
			trace( "pv.next           = " + pv.next );
			trace( "pv.isPrevious     = " + pv.isPrevious );
			trace( "pv.isNext         = " + pv.isNext );
			trace( "pv.isForward      = " + pv.isForward );
			trace( "pv.isBack         = " + pv.isBack );
			trace( "pv.forward        = " + pv.forward );
			trace( "pv.back           = " + pv.back );
			trace( "pv.offset         = " + pv.offset );
			trace( "pv.length         = " + pv.length );
			trace( "pv.pagelist.len   = " + pv.pagelist.length );
			
			return pv;
		}
		
	}

}