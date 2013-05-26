package com.kpi.module
{
	import com.kpi.cairngorm.global.Global;
	
	import mx.collections.ArrayCollection;
	import mx.events.ModuleEvent;
	import mx.modules.IModuleInfo;
	import mx.modules.ModuleLoader;
	import mx.modules.ModuleManager;
	
	public class ModuleLibrary
	{
		public static var LOAD_COMPLETE:String = "LOAD_COMPLETE";
		
		private static var global:Global = new Global();
		
		private static var _ModuleLibrary:ModuleLibrary;
		
		private static var moduleLoaders:ArrayCollection = new ArrayCollection();
		
		private static var modules:ArrayCollection = new ArrayCollection();
		
		public static function getInstance():ModuleLibrary {
			if(_ModuleLibrary == null) {
				_ModuleLibrary = new ModuleLibrary();
			}
			return _ModuleLibrary;
		}
		
		public static function loadModule(ml:ModuleLoader, moduleRequest:ModuleRequest):void {
			//var ml:ModuleLoader = new ModuleLoader();
			/*
		   var moduleInfo:IModuleInfo = ModuleManager.getModule( moduleRequest.swf );
		   trace("LOADING MOD");
		   moduleInfo.data = moduleRequest;
		   moduleInfo.addEventListener( ModuleEvent.READY, loadModuleComplete ); 
		   moduleInfo.load();
		   */

			moduleRequest.moduleLoader = ml;
			ml.addEventListener(ModuleEvent.READY, loadModuleComplete);
			ml.data = moduleRequest;
			ml.loadModule(moduleRequest.swf);
			
		}
		
		public static function loadModuleComplete(evt:ModuleEvent):void {
			trace("LOAD COMPLETE!");
			var mr:ModuleRequest = (evt.target as ModuleLoader).data as ModuleRequest;
			var module:Module = (evt.target as ModuleLoader).child as Module;
			mr.module = module;
			ModuleLibrary.modules.addItem(mr);
			global.event.dispatch(ModuleLibrary.LOAD_COMPLETE);
		}
		
		public static function getModule(code:String):Module {
			for each(var mr:ModuleRequest in ModuleLibrary.modules) {
				if(mr.code == code) {
					return mr.module;
				}
			}
			return null;
		}

	}
}