package com.kpi.managers
{
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	
	import mx.collections.ArrayCollection;
	import mx.containers.Canvas;
	import mx.core.IFlexDisplayObject;
	import mx.core.UIComponent;
	import mx.core.Window;
	import mx.events.FlexEvent;
	import mx.managers.PopUpManager;
	
	public class ToolTipManager
	{
		public function ToolTipManager()
		{
		}
		
		private static var toolTips:ArrayCollection = new ArrayCollection();
		
		public static function addToolTip(disp:DisplayObject, parent:DisplayObject):void {
			
			ToolTipManager.removeAllToolTips();
			
			var c:Canvas = PopUpManager.createPopUp(parent, Canvas) as Canvas;
			c.removeAllChildren();
			c.addChild(disp);
			PopUpManager.centerPopUp(c);
			ToolTipManager.toolTips.addItem(c);
			
			c.addEventListener(MouseEvent.MOUSE_OVER, mouseOver);
			c.addEventListener(MouseEvent.MOUSE_OUT, mouseOut);
			c.addEventListener(FlexEvent.UPDATE_COMPLETE, creationComplete);
			parent.addEventListener(MouseEvent.MOUSE_OVER, mouseOver);
			parent.addEventListener(MouseEvent.MOUSE_OUT, mouseOut);
			

			ToolTipManager.positionPopup(c);
			
			timeCheck = 5;
			timer.start();
			timer.addEventListener(TimerEvent.TIMER, timerUpdate);
			
		}
		
		private static function creationComplete(evt:FlexEvent):void {
			var popup:Canvas = evt.currentTarget as Canvas;
			ToolTipManager.positionPopup(popup);
		}
		
		private static function positionPopup(popup:Canvas):void {
			var parent:DisplayObject = popup.parentDocument as DisplayObject;
			var point:Point = parent.localToGlobal(new Point(0,0));
			
			var windowWidth:Number = Window.getWindow(parent as UIComponent).width;
			var windowHeight:Number = Window.getWindow(parent as UIComponent).height;
			
			var popupWidth:Number = popup.width;
			var popupHeight:Number = popup.height;
			
			var parentWidth:Number = parent.width;
			var parentHeight:Number = parent.height;
			
			var parentX:Number = point.x;
			var parentY:Number = point.y;
			
			//Put the popup right beneath the exact location of its parent
			var x:Number = parentX;
			var y:Number = parentY + parentHeight;
			
			
			/*
				Situation #1 The popup window goes of the right side of the screen
				In order to fix this we move it to the left, aligning it with whatever container it is in
			*/
			
			if(popupWidth + parentWidth + parentX > windowWidth) {
				x = parentX - (popupWidth - parentWidth);
			}
			
			/*
				Situation #2 The popup goes beyond the bottom window
			*/
			if(popupHeight + parentHeight + parentY > windowHeight) {
				y = parentY;
				y -= popupHeight;
			}
			
			/*
				Situation #3 The height of the popup makes it unable to go
				either below or above the button (must go to the left or right)
			*/
			if( (popupHeight + parentHeight + parentY > windowHeight)
				&& (popupHeight > parentY)) {
					y = 20;
				}
			
			if(x < 0) {
				x = 0;
			}
			if(y < 0) {
				y = 0;
			}
			popup.move(x,y);

		}
		
		private static function mouseOver(evt:MouseEvent):void {
			timeCheck = 5;
		}
		private static function mouseOut(evt:MouseEvent):void {
			timeCheck = 4;
		}
		
		private static var timer:Timer = new Timer(50);
		private static var timeCheck:Number = 0;
		
		private static function timerUpdate(evt:TimerEvent):void {
			if(timeCheck <= 0) {
				ToolTipManager.removeAllToolTips();
				timer.stop();
				timeCheck = 0;
			} else if(timeCheck == 5) {
				return;
			} else {
				timeCheck--;
			}
		}
		
		private static function removeAllToolTips():void {
			for each(var olddisp:IFlexDisplayObject in ToolTipManager.toolTips) {
				(olddisp as Canvas).removeAllChildren();
				ToolTipManager.removeToolTip(olddisp);
			}
		}
		
		public static function removeToolTip(disp:IFlexDisplayObject):void {
			ToolTipManager.toolTips.removeItemAt(ToolTipManager.toolTips.getItemIndex(disp));
			PopUpManager.removePopUp(disp);
		}
	}
}