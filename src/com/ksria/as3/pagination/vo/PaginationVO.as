package com.ksria.as3.pagination.vo 
{
	import mx.collections.ArrayList;
	
	/**
	 * Pagination VO
	 * 
	 * @author Kenshin
	 */
	[Bindable]
	public class PaginationVO 
	{
		
		/**
		 * 分页的总数据
		 */
		public var total : int;
		
		/**
		 * 当前页
		 */
		public var page : int;
		
		/**
		 * 每页的内容数
		 */
		public var pagesize : int;
		
		/**
		 * 最后一页
		 */
		public var lastpage : int;
		
		/**
		 * 共计多少分页
		 */
		public var loopcount : int;
		
		/**
		 * 前一页
		 */
		public var previous : int;
		
		/**
		 * 后一页
		 */
		public var next : int;
		
		/**
		 * 是否显示前一页
		 */
		public var isPrevious : Boolean;
		
		/**
		 * 是否显示后一页
		 */
		public var isNext : Boolean;
		
		/**
		 * 开始
		 * 例如：1 2 3 4 5 6，则指1；4 5 6 7 8 9，则指4
		 */
		public var begin : int;
		
		/**
		 * 步长
		 */
		public var step : int;
		
		/**
		 * 结束
		 * 例如：1 2 3 4 5 6，则指6；4 5 6 7 8 9，则指9
		 * 结束 = 开始（begin） + 步长（step）
		 */
		public var end : int;
		
		/**
		 * 前进到第几页
		 */
		public var forward : int;
		
		/**
		 * 后退到第几页
		 */
		public var back : int;
		
		/**
		 * 是否可以前进
		 */
		public var isForward : Boolean;
		
		/**
		 * 是否可以后退
		 */
		public var isBack : Boolean;
		
		/**
		 * 偏移量
		 * 例如当前分页为：1 2 3 4 5 6
		 * 点击6时，产生4 5 6 7 8 9(即偏移量为2)
		 * 而非 7 8 9 10 11 12
		 */
		public var offset : int;
		
		/**
		 * 步长
		 * 与step不完全一样，step是计算后的步长，length是原始步长
		 */
		public var length : int;
		
		/**
		 * 当前页所在的数组长度，由begin -> end的数组长度
		 */
		public var pagelist : ArrayList = new ArrayList();
		
		/**
		 * 全部页数的数组
		 */
		public var totallist : ArrayList = new ArrayList();
		
	}

}