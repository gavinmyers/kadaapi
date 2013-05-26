package com.kpi.module
{
	import com.kpi.cairngorm.global.Global;
	import com.kpi.cairngorm.model.ModelLocator;
	
	public interface IModule
	{
		function setGlobal(g:Global):void
		
		function getGlobal():Global
		
		function setModel(ml:ModelLocator):void
		
		function getModel():ModelLocator
		
	}
}