package com.kpi.utilities
{
	public class ImageLibrary
	{
		public function ImageLibrary()
		{
		}

/* *********************************
		WINDOWS
 ********************************* */
        [Embed(source="assets/swf/Library.swf", symbol="window")]
        [Bindable]   
        public static var Window:Class; 
        
        [Embed(source="assets/swf/Library.swf", symbol="tab_window")]
        [Bindable]   
        public static var WindowTab:Class; 
        
        [Embed(source="assets/swf/Library.swf", symbol="inner_window")]
        [Bindable]   
        public static var WindowPopup:Class; 


/* *********************************
		WINDOW ICONS
 ********************************* */

        [Embed(source="assets/swf/Library.swf", symbol="window_close_icon")]
        [Bindable]   
        public static var IconWindowClose:Class;
        
        [Embed(source="assets/swf/Library.swf", symbol="inner_window_close_icon")]
        [Bindable]   
        public static var IconWindowPopupClose:Class; 

/* *********************************
		INTERACTIVE ICONS
 ********************************* */
        [Embed(source="assets/swf/Library.swf", symbol="icon_gear_dropdown")]
        [Bindable]   
		public static var IconGearDropdown:Class; 

/* *********************************
		ICONS
 ********************************* */
        [Embed(source="assets/swf/Library.swf", symbol="user_icon")]
        [Bindable]   
        public static var IconUser:Class; 
                
        [Embed(source="assets/swf/Library.swf", symbol="browser_icon")]
        [Bindable]   
        public static var IconBrowser:Class; 
        
        [Embed(source="assets/swf/Library.swf", symbol="clock_icon")]
        [Bindable]   
        public static var IconClock:Class; 
        
        [Embed(source="assets/swf/Library.swf", symbol="date_icon")]
        [Bindable]   
        public static var IconDate:Class; 
        
        [Embed(source="assets/swf/Library.swf", symbol="kappfinder_icon")]
        [Bindable]   
        public static var IconSearch:Class; 
        
        [Embed(source="assets/swf/Library.swf", symbol="kchart_icon")]
        [Bindable]   
        public static var IconReports:Class; 
        
        [Embed(source="assets/swf/Library.swf", symbol="kcmdf_icon")]
        [Bindable]   
        public static var IconPlugins:Class; 
        
        [Embed(source="assets/swf/Library.swf", symbol="icon_alert")]
        [Bindable]   
        public static var IconAlert:Class;
        
        [Embed(source="assets/swf/Library.swf", symbol="icon_info")]
        [Bindable]   
        public static var IconInfo:Class;
        
        [Embed(source="assets/swf/Library.swf", symbol="favourites_star_icon")]
        [Bindable]   
        public static var IconStar:Class;
        
        [Embed(source="assets/swf/Library.swf", symbol="camera_test")]
        [Bindable]   
        public static var IconCheck:Class;
        
        [Embed(source="assets/swf/Library.swf", symbol="cancel")]
        [Bindable]   
        public static var IconCancel:Class;
        
        [Embed(source="assets/swf/Library.swf", symbol="delete")]
        [Bindable]   
        public static var IconDelete:Class;
        
        [Embed(source="assets/swf/Library.swf", symbol="insert_link")]
        [Bindable]   
        public static var IconLink:Class;
        
        [Embed(source="assets/swf/Library.swf", symbol="personal")]
        [Bindable]   
        public static var IconContractor:Class;

        [Embed(source="assets/swf/Library.swf", symbol="khexedit")]
        [Bindable]   
        public static var IconTabletGreen:Class;

        [Embed(source="assets/swf/Library.swf", symbol="package_editors")]
        [Bindable]   
        public static var IconTabletOrange:Class;
        
        [Embed(source="assets/swf/Library.swf", symbol="kservices")]
        [Bindable]   
        public static var IconGears:Class;
        
        [Embed(source="assets/swf/Library.swf", symbol="kwrite")]
        [Bindable]   
        public static var IconTabletRed:Class;
        
        [Embed(source="assets/swf/Library.swf", symbol="kfm_home")]
        [Bindable]   
        public static var IconSite:Class;
        
        [Embed(source="assets/swf/Library.swf", symbol="kcmpartitions")]
        [Bindable]   
        public static var IconChart:Class;       
        
        [Embed(source="assets/swf/Library.swf", symbol="package_network")]
        [Bindable]   
        public static var IconEarth:Class;   
        
        [Embed(source="assets/swf/Library.swf", symbol="package_development")]
        [Bindable]   
        public static var IconTools:Class;   
        
        [Embed(source="assets/swf/Library.swf", symbol="kuser")]
        [Bindable]   
        public static var IconUsers:Class;   
        
        [Embed(source="assets/swf/Library.swf", symbol="kwikdisk")]
        [Bindable]   
        public static var IconBlocks:Class;   
        
        [Embed(source="assets/swf/Library.swf", symbol="package")]
        [Bindable]   
        public static var IconPackageOpen:Class;   
        
        [Embed(source="assets/swf/Library.swf", symbol="korganizer")]
        [Bindable]   
        public static var IconSurvey:Class;            
        
        [Embed(source="assets/swf/Library.swf", symbol="kcalc")]
        [Bindable]   
        public static var IconCalculator:Class;  
        
        [Embed(source="assets/swf/Library.swf", symbol="irkick")]
        [Bindable]   
        public static var IconIVR:Class;  
        
        [Embed(source="assets/swf/Library.swf", symbol="khotkeys")]
        [Bindable]   
        public static var IconKeyboard:Class;  
        
        [Embed(source="assets/swf/Library.swf", symbol="digikam")]
        [Bindable]   
        public static var IconCamera:Class; 
        
        
/* *********************************
		TAB PANEL
 ********************************* */
        [Embed(source="assets/swf/Library.swf", symbol="tab_button_selected")]
        [Bindable]   
        public static var TabDown:Class;
        
/* *********************************
		ACTION BUTTONS
 ********************************* */
        [Embed(source="assets/swf/Library.swf", symbol="action_button")]
        [Bindable]   
        public static var ActionButton:Class;
        
        [Embed(source="assets/swf/Library.swf", symbol="action_button_green")]
        [Bindable]   
        public static var ActionButtonComplete:Class;
        
        [Embed(source="assets/swf/Library.swf", symbol="action_button_red")]
        [Bindable]   
        public static var ActionButtonError:Class;
        
        [Embed(source="assets/swf/Library.swf", symbol="action_button_yellow")]
        [Bindable]   
        public static var ActionButtonWarning:Class;
/* *********************************
		POPUP ToolTips
 ********************************* */
        [Embed(source="assets/swf/Library.swf", symbol="popup_top_left")]
        [Bindable]   
        public static var ToolTipTopLeft:Class;
        
        
/* *********************************
		EXPANDER
 ********************************* */
        [Embed(source="assets/swf/Library.swf", symbol="expander_open")]
        [Bindable]   
        public static var ExpanderBackgroundOpen:Class;
        
        [Embed(source="assets/swf/Library.swf", symbol="expander_closed")]
        [Bindable]   
        public static var ExpanderBackgroundClosed:Class;
        
        [Embed(source="assets/swf/Library.swf", symbol="expander_check_open")]
        [Bindable]   
        public static var ExpanderCheckBackgroundOpen:Class;
        
        [Embed(source="assets/swf/Library.swf", symbol="expander_check_closed")]
        [Bindable]   
        public static var ExpanderCheckBackgroundClosed:Class;

/* *********************************
		CALENDAR
 ********************************* */
        [Embed(source="assets/swf/Library.swf", symbol="week_day")]
        [Bindable]   
        public static var CalendarWeekdayBackground:Class;
                
/* *********************************
		PROJECT
 ********************************* */
        [Embed(source="assets/swf/Library.swf", symbol="project_status_0")]
        [Bindable]   
        public static var IconProjectStatus0:Class;
        
        
        [Embed(source="assets/swf/Library.swf", symbol="project_status_2")]
        [Bindable]   
        public static var IconProjectStatus2:Class; 
        
        [Embed(source="assets/swf/Library.swf", symbol="project_status_3")]
        [Bindable]   
        public static var IconProjectStatus3:Class; 
        
        [Embed(source="assets/swf/Library.swf", symbol="project_status_4")]
        [Bindable]   
        public static var IconProjectStatus4:Class; 
        
        [Embed(source="assets/swf/Library.swf", symbol="project_status_5")]
        [Bindable]   
        public static var IconProjectStatus5:Class; 
        
        [Embed(source="assets/swf/Library.swf", symbol="project_status_6")]
        [Bindable]   
        public static var IconProjectStatus6:Class; 

/* *********************************
		Work Order Template
 ********************************* */
        [Embed(source="assets/swf/Library.swf", symbol="arrow_orange")]
        [Bindable]   
        public static var ArrowOrange:Class; 
        
        [Embed(source="assets/swf/Library.swf", symbol="arrow_joint_orange")]
        [Bindable]   
        public static var ArrowJointOrange:Class; 
	}
}