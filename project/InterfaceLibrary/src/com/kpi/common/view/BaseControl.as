package com.kpi.common.view
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.kpi.common.event.KPIEventDispatcher;
	import com.kpi.interfaces.controls.StandardControl;
	
	import flash.display.DisplayObject;
	import flash.display.InteractiveObject;
	import flash.events.FocusEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import mx.core.Container;
	import mx.core.EdgeMetrics;
	import mx.validators.StringValidator;
	
	
	/*
	Is your control not showing up when you expect it to be?
	First make sure the control displays properly in a new blank MXML file. If it does then
	the problem probably has something to do with where the control is placed. Flex does
	dynamic height measurements so a control added to an area with a height of 0 will not
	show up. An easy example is this:
	<mx:VBox>
		<mx:Canvas width="100" height"100" backgroundColor="Green"/>
		<mx:Canvas width="100" height"100" backgroundColor="Green"/>
		<mx:Canvas width="100" height"100" backgroundColor="Green"/>
		<mx:Canvas width="100%" height"100%">
			<!-- this will not show up-->
			<control:MyControl/>
		</mx:Canvas>
	</mx:VBox>
	
	Why doesn't it show up?
	Because the canvas is rendered first and it determines that it (by itself) has a height of 0
	Then the control is rendered and it is placed in an area with a height of 0
	
	How to fix this?
	The easiest way would be to reorganize your MXML 
	The harder way is to look into fixing this bug permanently, that involves looking
	at the order on which items are rendered in the stack and will take some time (a few days work)
	*/
	
	public class BaseControl extends StandardControl
	{
		[Bindable]
		public var title:String;
		
		
		public static var UPDATE:String = "UPDATE";
		public static var UPDATE_COMPLETE:String = "UPDATE_COMPLETE";
		
		public static var SHOW:String = "SHOW";
		public static var SHOW_COMPLETE:String = "SHOW_COMPLETE";
		
		public static var HIDE:String = "HIDE";
		public static var HIDE_COMPLETE:String = "HIDE_COMPLETE";
		
		public static var RESET:String = "RESET";
		public static var RESET_COMPLETE:String = "RESET_COMPLETE";
		
				
		public function BaseControl()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStage);
			event.addEventListener(BaseControl.UPDATE,update);
			event.addEventListener(BaseControl.SHOW,show);
			event.addEventListener(BaseControl.HIDE,hide); 
			event.addEventListener(BaseControl.RESET,reset);
			addEventListener("focusIn", makeFocusedItemVisible);
			this.updatePage();
			this.constructor();
		}
		
		public function toObject():Object {
			var obj:Object = new Object();
			obj["label"] = this.title;
			obj["icon"] = this.icon;
			obj["data"] = this;
			return obj;
		}
		
		private function addedToStage(obj:Object):void {
			this.updatePage();
		}
		

	
//START
		   
        public function makeFocusedItemVisible(event:FocusEvent):void {
            // Target is the actual object that has focus.
            trace("makeFocusedItemVisible is running!");
            var target:InteractiveObject = InteractiveObject(event.target);
            // OriginalTarget is the component that has focus as some
            // component actually delegate true focus to an internal object.
            var originalTarget:InteractiveObject = 
        InteractiveObject(focusManager.findFocusManagerComponent(target));
    	if(originalTarget == null){
    		return;
    	}
            // The viewable portion of a container
            var viewport:Rectangle = new Rectangle();
            do {
                // Cycle through all parents looking for containers.
                if (target.parent is Container) {
                    var viewportChanged:Boolean = false;
                    var c:Container = target.parent as Container;

                    // Get the viewable area in the container.
                    var vm:EdgeMetrics = c.viewMetrics;
                    viewport.x = vm.left;
                    viewport.y = vm.top;
                    viewport.width = 
                        c.width / c.scaleX - vm.left - vm.right;
                    viewport.height = 
                        c.height / c.scaleY - vm.top - vm.bottom;
                    
                    // Calculate the position of the target in the container.
                    var topLeft:Point = new Point(0, 0);
                    var bottomRight:Point = 
                new Point(originalTarget.width, originalTarget.height);
                    topLeft = originalTarget.localToGlobal(topLeft);
                    topLeft = c.globalToLocal(topLeft);
                    bottomRight = originalTarget.localToGlobal(bottomRight);
                    bottomRight = c.globalToLocal(bottomRight);
    
                    // Figure out if we have to move the scroll bars.
                    // If the scroll bar moves, the position of the component
                    // moves as well. This algorithm makes sure the top
                    // left of the component is visible if the component is
                    // bigger than the viewport.
                    var delta:Number;

                    if (bottomRight.x > viewport.right) {
                        delta = bottomRight.x - viewport.right;
                        c.horizontalScrollPosition += delta;
                        topLeft.x -= delta;
                        viewportChanged = true;
                    }

                    if (topLeft.x < viewport.left) {
                        // leave it a few pixels in from the left
                        c.horizontalScrollPosition -= 
                            viewport.left - topLeft.x + 2;
                        viewportChanged = true;
                    }
                    
                    if (bottomRight.y > viewport.bottom) {
                        delta = bottomRight.y - viewport.bottom;
                        c.verticalScrollPosition += delta;
                        topLeft.y -= delta;
                        viewportChanged = true;
                    }
                    
                    if (topLeft.y < viewport.top) {
                        // leave it a few pixels down from the top
                        c.verticalScrollPosition -= 
                            viewport.top - topLeft.y + 2;
                        viewportChanged = true;
                    }
                    
                    // You must the validateNow() method to get the 
                    // container to move the component before working 
                    // on the next parent.
                    // Otherwise, your calculations will be incorrect.
                    if (viewportChanged) {
                        c.validateNow();
                    }
                }
                
                target = target.parent;
            }
            
            while (target != this);
        }
//END
		
		public function constructor():void {
			
		}
		
		public function updatePage():void {

			var par:DisplayObject = this.parent;
			for(var i:int = 0; i < 50; i++) {
				if(par == null) {
					return
				} else if(par is BasePage) {
					this.page = par as BasePage;
					break;
				} else {
					par = par.parent;
				}
			}
		}
		
		
		//Page
		[Bindable]
		public var page:BasePage;
		
		//Page
		[Bindable]
		public var active:Boolean;
		
		//Local Event
		[Bindable]
		public var event:KPIEventDispatcher = new KPIEventDispatcher();
		
		
		[Bindable]				
		public var changed:Boolean = false;
		
		public var stringValidtor:StringValidator = new StringValidator();
		

		public function validate():Boolean {
			return true;
		}
		
		public function show(evt:CairngormEvent):void {
			this.active = true;
			event.dispatchEvent(new CairngormEvent(BaseControl.SHOW_COMPLETE));
		}
		
		public function hide(evt:CairngormEvent):void {
			this.active = false; 
			event.dispatchEvent(new CairngormEvent(BaseControl.HIDE_COMPLETE));
		}
		
		public function update(evt:CairngormEvent):void {
			event.dispatchEvent(new CairngormEvent(BaseControl.UPDATE_COMPLETE));
		}
		
		public function reset(evt:CairngormEvent):void {
			event.dispatchEvent(new CairngormEvent(BaseControl.RESET_COMPLETE));
		}
		
		public function doReset(callback:Function = null):void {
			if(callback != null) {
				event.addEventListener(BaseControl.RESET_COMPLETE, callback);
			}
			event.dispatchEvent(new CairngormEvent(BaseControl.RESET));
		}
		
		public function doHide(callback:Function = null):void {
			if(callback != null) {
				event.addEventListener(BaseControl.HIDE_COMPLETE, callback);
			}
			event.dispatchEvent(new CairngormEvent(BaseControl.HIDE));
		}
		
		public function doShow(callback:Function = null):void {
			if(callback != null) {
				event.addEventListener(BaseControl.SHOW_COMPLETE, callback);
			}
			event.dispatchEvent(new CairngormEvent(BaseControl.SHOW));
		}
		
		public function doUpdate(callback:Function = null):void {
			if(callback != null) {
				event.addEventListener(BaseControl.UPDATE_COMPLETE, callback);
			}
			event.dispatchEvent(new CairngormEvent(BaseControl.UPDATE));
		}
		
		public override function toString():String {
			return this.label;
		}

	}
}