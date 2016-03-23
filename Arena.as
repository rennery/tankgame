package {
	import flash.events.EventDispatcher;
    import flash.events.Event;

	public class Arena extends EventDispatcher implements models{
		public var array_wall:Array;
		public var array_enemy:Array;
		public var array_iron:Array;
		public var array_boss:Array;
		public var array_bul:Array;
		public var level:int;
		public var replay:int;
		public var tryagain:int;
		public var lv_s:Lv_show;
		public var nu:number_bullet;
		public var your_tank1:lv1_tank;
		public var sc:Score;
		public function Arena() {
			// constructor code
			array_wall=new Array();
			lv_s=new Lv_show();
			sc=new Score();
			nu=new number_bullet();
			array_enemy=new Array();
			array_iron=new Array();
			array_boss=new Array();
			array_bul=new Array();
			your_tank1=new lv1_tank();
			replay=0;
		}
		
		public function LV1(){
			var i;int;
			level=1;
			for(i=0;i<20;i++){
				var bu=new bullet();
				array_bul.push(bu);
			}
			for(i=0;i<5;i++){
				var en=new enemy();
				array_enemy.push(en);
			}
			for(i=0;i<6;i++){
				var wa=new wall();
				array_wall.push(wa);
			}
			trace("lv1");
		}
		
		public function LV2(){
			var i;int;
			level=2;
			for(i=0;i<20;i++){
				var bu=new bullet();
				array_bul.push(bu);
			}
			for(i=0;i<5;i++){
				array_enemy.pop();
			}
			for(i=0;i<6;i++){
				array_wall.pop();
				array_boss.pop();
			}
			for(i=0;i<4;i++){
				var en=new enemy();
				array_enemy.push(en);
			}
			for(i=0;i<10;i++){
				var wa=new wall();
				array_wall.push(wa);
			}
			for(i=0;i<1;i++){
				var bo=new boss();
				array_boss.push(bo);
			}
		}
		public function upgrade(i:int){ 
		trace(replay);
			if(i==1){
			dispatchEvent(new Event("lv1_creat"));}
			else if(i==2){
				trace(replay);
			dispatchEvent(new Event("lv2_creat"));
			
			}
			else if(i==3){
			dispatchEvent(new Event("shoot"));
			
			}
			else if(i==4){
				replay=1;
				tryagain=1;
				dispatchEvent(new Event("gameover"));
				
			}
			else if(i==5){
				replay=5;
				tryagain=5;
				dispatchEvent(new Event("gameover"));
				
			}
		}

	}
	
}
