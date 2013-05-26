package com.kpi.module
{
	import mx.modules.ModuleLoader;
	
	public class ModuleRequest
	{
		public function ModuleRequest(swf:String, code:String)
		{
			this.swf = swf;
			this.code = code;
		}
		
		public function set swf(o:String):void { _swf = o; }
		public function get swf():String { return _swf; }
		private var _swf:String;
		
		public function set code(o:String):void { _code = o;}
		public function get code():String { return _code;}
		private var _code:String;
		
		public function set module(o:Module):void {_module = o; }
		public function get module():Module {return _module;}
		private var _module:Module;
		
		public function set moduleLoader(o:ModuleLoader):void {_moduleLoader = o; }
		public function get moduleLoader():ModuleLoader {return _moduleLoader;}
		private var _moduleLoader:ModuleLoader;
		
		
	}
}