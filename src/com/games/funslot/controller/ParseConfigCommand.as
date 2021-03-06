package com.games.funslot.controller 
{
	import com.games.funslot.enum.AssetID;
	import com.games.funslot.events.LoadEvent;
	import com.games.funslot.model.api.IConfigModel;
	import com.games.funslot.service.api.IAssetProvider;
	import robotlegs.bender.bundles.mvcs.Command;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class ParseConfigCommand extends Command
	{
		[Inject]
		public var assetProvider:IAssetProvider;
		
		[Inject]
		public var configModel:IConfigModel;
		
		override public function execute():void
		{
			configModel.parseConfigXML(assetProvider.getXML(AssetID.CONFIG_XML));
		}
		
	}

}