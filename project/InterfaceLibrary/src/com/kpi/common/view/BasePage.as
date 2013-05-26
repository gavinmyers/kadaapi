package com.kpi.common.view
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.kpi.common.event.KPIEventDispatcher;
	import com.kpi.interfaces.windows.StandardWindow;
	
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;
	
	import mx.events.FlexEvent;
	
	public class BasePage extends StandardWindow 
	{
		public function BasePage()
		{
			
			this.addEventListener(FlexEvent.CREATION_COMPLETE, creationComplete);
			this.addEventListener(Event.CLOSE, closeEvent);
			event.addEventListener(BasePage.UPDATE,update);
			event.addEventListener(BasePage.SHOW,show);
			event.addEventListener(BasePage.HIDE,hide);
			event.addEventListener(BasePage.VALIDATE,validate);
			event.addEventListener(BasePage.PROGRESS_NEXT,progressNext);
			event.addEventListener(BasePage.PROGRESS_PREVIOUS,progressPrevious);
			this.qualifiedClassName = flash.utils.getQualifiedClassName(this);
		}
		
		public var qualifiedClassName:String;
		
		public var validated:Boolean = true;
		
		public static var UPDATE:String = "UPDATE";
		public static var UPDATE_COMPLETE:String = "UPDATE_COMPLETE";
		
		public static var SHOW:String = "SHOW";
		public static var SHOW_COMPLETE:String = "SHOW_COMPLETE";
		
		public static var VALIDATE:String = "VALIDATE";
		public static var VALIDATE_COMPLETE:String = "VALIDATE_COMPLETE";
		
		public static var HIDE:String = "HIDE";
		public static var HIDE_COMPLETE:String = "HIDE_COMPLETE";
		
		public static var PROGRESS_NEXT:String = "PROGRESS_NEXT";
		public static var PROGRESS_NEXT_COMPLETE:String = "PROGRESS_NEXT_COMPLETE";

		public static var PROGRESS_PREVIOUS:String = "PROGRESS_PREVIOUS";
		public static var PROGRESS_PREVIOUS_COMPLETE:String = "PROGRESS_PREVIOUS_COMPLETE";
		
		//Page Event
		[Bindable]
		public var event:KPIEventDispatcher = new KPIEventDispatcher();
		
		private function closeEvent(evt:Event):void {
			this.doHide();
		}
		
		public function validate(evt:CairngormEvent):void {
			event.dispatchEvent(new CairngormEvent(BasePage.VALIDATE_COMPLETE));
		}
		
		public function show(evt:CairngormEvent):void {
			event.dispatchEvent(new CairngormEvent(BasePage.SHOW_COMPLETE));
		}
		
		public function hide(evt:CairngormEvent):void { 
			this.close();
			event.dispatchEvent(new CairngormEvent(BasePage.HIDE_COMPLETE));
		}
		
		public function update(evt:CairngormEvent):void {
			event.dispatchEvent(new CairngormEvent(BasePage.UPDATE_COMPLETE));
		}
		
		public function progressNext(evt:CairngormEvent):void {
			event.dispatchEvent(new CairngormEvent(BasePage.PROGRESS_NEXT_COMPLETE));
		}
		
		public function progressPrevious(evt:CairngormEvent):void {
			event.dispatchEvent(new CairngormEvent(BasePage.PROGRESS_PREVIOUS_COMPLETE));
		}
		
		public function doProgressNext(callback:Function = null):void {
			if(callback != null) {
				event.addEventListener(BasePage.PROGRESS_NEXT_COMPLETE, callback);
			}
			event.dispatchEvent(new CairngormEvent(BasePage.PROGRESS_NEXT));
		}
		
		public function doProgressPrevious(callback:Function = null):void {
			if(callback != null) {
				event.addEventListener(BasePage.PROGRESS_PREVIOUS_COMPLETE, callback);
			}
			event.dispatchEvent(new CairngormEvent(BasePage.PROGRESS_PREVIOUS));
		}
		
		public function doValidate(callback:Function = null):void {
			if(callback != null) {
				event.addEventListener(BasePage.VALIDATE_COMPLETE, callback);
			}
			event.dispatchEvent(new CairngormEvent(BasePage.VALIDATE));
		}
		
		public function doHide(callback:Function = null):void {
			if(callback != null) {
				event.addEventListener(BasePage.HIDE_COMPLETE, callback);
			}
			event.dispatchEvent(new CairngormEvent(BasePage.HIDE));
		}
		
		public function doShow(callback:Function = null):void {
			if(callback != null) {
				event.addEventListener(BasePage.SHOW_COMPLETE, callback);
			}
			event.dispatchEvent(new CairngormEvent(BasePage.SHOW));
		}
		
		public function doUpdate(callback:Function = null):void {
			if(callback != null) {
				event.addEventListener(BasePage.UPDATE_COMPLETE, callback);
			}
			event.dispatchEvent(new CairngormEvent(BasePage.UPDATE));
		}
		
		private function creationComplete(evt:FlexEvent):void {
			this.doShow();
		}
		

	}
}