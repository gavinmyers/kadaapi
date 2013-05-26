package com.kpi.cairngorm.view.core
{
	import com.kpi.cairngorm.global.Global;
	import com.kpi.cairngorm.model.ModelLocator;
	import com.kpi.common.view.BasePopup;
	
	

	public class Popup extends BasePopup
	{

		
		public function Popup()
		{
			super();
			//global.model.session.pages[this.qualifiedClassName] = this;			

		}

		//Popup Model
		[Bindable]
		public var model:ModelLocator = new ModelLocator();
		
		
		//Global Object
		[Bindable]
		public var global:Global = Global.Instance();
		


	}
}
