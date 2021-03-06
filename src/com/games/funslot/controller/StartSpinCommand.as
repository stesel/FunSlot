package com.games.funslot.controller 
{
	import com.games.funslot.events.factories.GameEventFactory;
	import com.games.funslot.events.factories.SpinEventFactory;
	import com.games.funslot.events.SpinEvent;
	import com.games.funslot.model.api.IGameModel;
	import com.games.funslot.service.api.IGameProccesService;
	import flash.events.IEventDispatcher;
	import robotlegs.bender.bundles.mvcs.Command;
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class StartSpinCommand extends Command
	{
		[Inject]
		public var eventDispatcher:IEventDispatcher;
		
		[Inject]
		public var gameModel:IGameModel;
		
		[Inject]
		public var gameProccesService:IGameProccesService;
		
		override public function execute():void
		{
			eventDispatcher.dispatchEvent( SpinEventFactory.procedureDisableSpinEvent() );
			
			gameModel.balance = gameModel.balance - gameModel.bet;
			
			gameModel.win = 0;
			
			eventDispatcher.dispatchEvent( GameEventFactory.procedureGameModelUpdatedEvent() );
			
			gameProccesService.startSpin();
		}
	}
}