package com.kpi.cairngorm.global
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.kpi.cairngorm.model.ModelLocator;
	import com.kpi.common.event.KPIEventDispatcher;
	
	[Bindable]
	public class Global
	{
		public function Global()
		{
		}
		
		private static var instance:Global;
		public static function Instance() : Global {
			if (instance == null) {
				instance = new Global();
			}
			return instance;
		}
		
		
		public var service:ServiceLocator = ServiceLocator.getInstance();
		
		public var model:ModelLocator = ModelLocator.Global();
		
		public var event:KPIEventDispatcher = KPIEventDispatcher.getInstance();

	}
}
