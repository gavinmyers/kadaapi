package com.kpi.cairngorm.view.core
{
	import com.kpi.cairngorm.global.Global;
	import com.kpi.cairngorm.model.ModelLocator;
	import com.kpi.common.view.BasePage;
	
	

	public class Page extends BasePage
	{

		
		public function Page()
		{
			super();
			//global.model.session.pages[this.qualifiedClassName] = this;			

		}

		//Page Model
		[Bindable]
		public var model:ModelLocator = new ModelLocator();
		
		
		//Global Object
		[Bindable]
		public var global:Global = Global.Instance();
		


	}
}
