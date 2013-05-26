package com.kpi.cairngorm.view.core
{
	import com.kpi.cairngorm.global.Global;
	import com.kpi.cairngorm.model.ModelLocator;
	import com.kpi.common.view.BaseControl;
	
	
	public class Control extends BaseControl
	{
		
		//Local Model
		[Bindable]
		public var model:ModelLocator = new ModelLocator();

		//Global Object
		[Bindable]
		public var global:Global = Global.Instance();
		
	}
}
