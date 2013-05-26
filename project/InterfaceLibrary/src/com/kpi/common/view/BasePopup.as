package com.kpi.common.view
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.kpi.common.event.KPIEventDispatcher;
	import com.kpi.interfaces.windows.PopupWindow;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;
	
	import mx.core.UIComponent;
	import mx.core.Window;
	import mx.events.FlexEvent;
	import mx.managers.PopUpManager;
	
	public class BasePopup extends PopupWindow 
	{
		public function BasePopup()
		{
			
			this.addEventListener(FlexEvent.CREATION_COMPLETE, creationComplete);
			this.addEventListener(Event.CLOSE, closeEvent);
			event.addEventListener(BasePopup.UPDATE,update);
			event.addEventListener(BasePopup.SHOW,show);
			event.addEventListener(BasePopup.HIDE,hide);
			event.addEventListener(BasePopup.VALIDATE,validate);
			event.addEventListener(BasePopup.PROGRESS_NEXT,progressNext);
			event.addEventListener(BasePopup.PROGRESS_PREVIOUS,progressPrevious);
			this.qualifiedClassName = flash.utils.getQualifiedClassName(this);
		}
		
		private var window:BasePage;
		
		public function open(currentParent:UIComponent):void {
			var application:DisplayObject = currentParent.parentApplication as DisplayObject;
			this.window = Window.getWindow(currentParent as UIComponent) as BasePage;
			var windowWidth:Number = window.width;
			var windowHeight:Number = window.height;
			window.doDisable();
			if(this.width == 0 && this.height == 0) {
				//full screen
				this.width = windowWidth - 80;
				this.height = windowHeight - 60;
			}
			
			PopUpManager.addPopUp(this,application,false);
			PopUpManager.centerPopUp(this);
		}
		
		public function close():void {
			window.doEnable();
			PopUpManager.removePopUp(this);
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
			event.dispatchEvent(new CairngormEvent(BasePopup.VALIDATE_COMPLETE));
		}
		
		public function show(evt:CairngormEvent):void {
			event.dispatchEvent(new CairngormEvent(BasePopup.SHOW_COMPLETE));
		}
		
		public function hide(evt:CairngormEvent):void { 
			this.close();
			event.dispatchEvent(new CairngormEvent(BasePopup.HIDE_COMPLETE));
		}
		
		public function update(evt:CairngormEvent):void {
			event.dispatchEvent(new CairngormEvent(BasePopup.UPDATE_COMPLETE));
		}
		
		public function progressNext(evt:CairngormEvent):void {
			event.dispatchEvent(new CairngormEvent(BasePopup.PROGRESS_NEXT_COMPLETE));
		}
		
		public function progressPrevious(evt:CairngormEvent):void {
			event.dispatchEvent(new CairngormEvent(BasePopup.PROGRESS_PREVIOUS_COMPLETE));
		}
		
		public function doProgressNext(callback:Function = null):void {
			if(callback != null) {
				event.addEventListener(BasePopup.PROGRESS_NEXT_COMPLETE, callback);
			}
			event.dispatchEvent(new CairngormEvent(BasePopup.PROGRESS_NEXT));
		}
		
		public function doProgressPrevious(callback:Function = null):void {
			if(callback != null) {
				event.addEventListener(BasePopup.PROGRESS_PREVIOUS_COMPLETE, callback);
			}
			event.dispatchEvent(new CairngormEvent(BasePopup.PROGRESS_PREVIOUS));
		}
		
		public function doValidate(callback:Function = null):void {
			if(callback != null) {
				event.addEventListener(BasePopup.VALIDATE_COMPLETE, callback);
			}
			event.dispatchEvent(new CairngormEvent(BasePopup.VALIDATE));
		}
		
		public function doHide(callback:Function = null):void {
			if(callback != null) {
				event.addEventListener(BasePopup.HIDE_COMPLETE, callback);
			}
			event.dispatchEvent(new CairngormEvent(BasePopup.HIDE));
		}
		
		public function doShow(callback:Function = null):void {
			if(callback != null) {
				event.addEventListener(BasePopup.SHOW_COMPLETE, callback);
			}
			event.dispatchEvent(new CairngormEvent(BasePopup.SHOW));
		}
		
		public function doUpdate(callback:Function = null):void {
			if(callback != null) {
				event.addEventListener(BasePopup.UPDATE_COMPLETE, callback);
			}
			event.dispatchEvent(new CairngormEvent(BasePopup.UPDATE));
		}
		
		private function creationComplete(evt:FlexEvent):void {
			this.doShow();
		}
		

	}
}