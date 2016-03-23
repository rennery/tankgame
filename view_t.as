package {
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	[SWF(width="1024",height="548",frameRate="60",backgroundColor="#ffffff")]
	public class view_t extends Sprite implements View{
		
		[Embed(source="imgs/welcome.jpg",mimeType="image/jpg")]
		private var back:Class;
		[Embed(source="imgs/playback.jpg",mimeType="image/jpg")]
		private var playback:Class;
		[Embed(source="imgs/tuto.png",mimeType="image/png")]
		private var tuto_back:Class;
		[Embed(source="imgs/win.jpg",mimeType="image/jpg")]
		private var winback:Class;
		public  var p_button:play_but;
		public  var t_button:tuto_but;
		private static var v:view_t;
		private var cc:Control;
		private var nb:nextlv;
		public var swfback:Bitmap;
		public var ar:Arena;
		private var tu:int;
		private var playagain:int;
		public function view_t() {
			// constructor code
			
		}
		
		public function setArena(a:Arena){
			ar=a;
			ar.addEventListener("lv1_creat",initar);
			ar.addEventListener("lv2_creat",initar);
			ar.addEventListener("shoot",initar);
			ar.addEventListener("gameover",initar);
		}
		public function setWelcome(){
			swfback=new back();
			addChild(swfback);
			p_button=new play_but();
			t_button=new tuto_but();
			addChild(p_button);
			addChild(t_button);
			tu=1;
			p_button.x=900;
			p_button.y=400;
			t_button.x=900;
			t_button.y=500;
		}
		public function setEnd(){
			p_button.visible=false;
			
		}
		public function setTuto(){
			removeChild(swfback);
			swfback=new tuto_back();
			addChildAt(swfback,0);
			removeChild(t_button);
			trace("11111");
			tu=0;
		}
		public function update(){
			ar.lv_s.pctText.visible=false;
			removeChild(swfback);
			for each(var en:enemy in ar.array_enemy){
					removeChild(en);
					
				}
				for each(var wa:wall in ar.array_wall){
					removeChild(wa);
					
				}
			swfback=new winback();
			addChild(swfback);
			addChild(ar.sc.getpctText1(ar.level));
			ar.sc.pctText1.visible=true;
			if(ar.level=1){
			nb=new nextlv();
			addChild(nb);
			}
		}
		public function gameover(){
			playagain=1;
			tu=0;
			ar.lv_s.pctText.visible=false;
			removeChild(ar.nu.pctText);
			if(ar.level==1){
				removeChild(swfback);
			for each(var en:enemy in ar.array_enemy){
					removeChild(en);
					
				}
			
			for each(var wa:wall in ar.array_wall){
					removeChild(wa);
					
				}
			
			swfback=new winback();
			addChild(swfback);
			addChild(ar.sc.getpctText1(3));
		    addChild(p_button);
			}
			else{
				removeChild(swfback);
			for each(var en:enemy in ar.array_enemy){
					removeChild(en);
				}
				for each(var wa:wall in ar.array_wall){
					removeChild(wa);
					
				}
				for each(var b:boss in ar.array_boss){
					removeChild(b);
					
			}
			swfback=new winback();
			addChild(swfback);
			addChild(ar.sc.getpctText1(3));
			ar.sc.pctText1.visible=true;
		    addChild(p_button);
			}
			
		}
		public  function getView(c:Control):void{
			cc=c;
		}
		private function handel(e:MouseEvent){
			cc.dosth(e);
			
			
		}
		private function initar(e:Event){
			
			if(e.type=="lv2_creat"){
				addChild(ar.lv_s.pctText);
				ar.lv_s.pctText.visible=true;
				if(ar.replay==1 &&playagain==1){
					trace(ar.replay);
					removeChild(ar.sc.pctText1);
					removeChild(p_button);
					
					tu=0;
					
				}
				for each(var en:enemy in ar.array_enemy){
					addChild(en);
					
				}
				for each(var wa:wall in ar.array_wall){
					addChild(wa);
					
				}for each(var b:boss in ar.array_boss){
					addChild(b);
					
				}
			
				addChild(ar.your_tank1);
				if(ar.replay==0 || playagain==0)
				removeChild(nb);
				removeChild(swfback);
				ar.replay=0;
				playagain=0;
			swfback=new playback();
			addChildAt(swfback,0);
			addChildAt(ar.sc.pctText,3);
			ar.sc.pctText1.visible=false;
			addChild(ar.nu.pctText);
			}
			if(e.type=="lv1_creat"){
				addChild(ar.lv_s.pctText);
				ar.lv_s.pctText.visible=true;
				if(ar.replay==1 && playagain==1){
					removeChild(ar.sc.pctText1);
					playagain=0;
					ar.replay=0;
					tu=0;
				}
				for each(var en:enemy in ar.array_enemy){
					addChild(en);
					
				}
				for each(var wa:wall in ar.array_wall){
					addChild(wa);
					
				}
			
				addChild(ar.your_tank1);
			removeChild(p_button);
			removeChild(swfback);
			swfback=new playback();
			addChildAt(swfback,0);
			addChildAt(ar.sc.pctText,3);
			addChild(ar.nu.pctText);
			if(tu==1){
				removeChild(t_button);
			}
			}
			if(e.type=="gameover"){
				if(ar.sc.sc==500 ||ar.sc.sc==1400)
					update();
				else{
					gameover();
					}
				
			}
			if(e.type=="shoot"){
				for each(var bu:bullet in ar.array_bul){
					if(bu.addable==true && bu.useful==false){
					addChildAt(bu,4);
					bu.addable=false;
					}
				}
			}
		}
	}
	
}
