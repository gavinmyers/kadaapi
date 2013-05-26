package com.kpi.cairngorm.model
{
	import mx.core.WindowedApplication;
	
	[Bindable]
	public class Session
	{
		// Single Instance of Our ModelLocator
		private static var instance:Session;

		// Returns the Single Instance
		public static function Global() : Session {
			if (instance == null) {
				instance = new Session();
			}
			return instance;
		}
				
		public var application:WindowedApplication;
		
		public var version:String;
		
	}
}
