package  {
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.MouseEvent;
	public class Control {
		private var v:view_t;
		private var hitted:Boolean;
		private var killnumber:int;
		public var array_wall:Array;
		public var array_enemy:Array;
		public var array_iron:Array;
		public var array_boss:Array;
		public var are:Arena;
		private var timer:Timer;
		public var xx,yy,t_k,kk:int;
		public var x_s,y_s:int;
		public var bul_number:int;
		public var arrayy,s:Array;
		public var arrayx:Array;
		public function Control() {
			// constructor code
			arrayx=new Array();
			arrayy=new Array();
			t_k=60;
			arrayx.push(t_k);
			t_k=118;
			arrayx.push(t_k);
			t_k=458;
			arrayx.push(t_k);
			t_k=718;
			arrayx.push(t_k);
			t_k=818;
			arrayx.push(t_k);// tank position
			
			t_k=218;
			arrayx.push(t_k);
			t_k=518;
			arrayx.push(t_k);
			t_k=258;
			arrayx.push(t_k);
			t_k=178;

			arrayx.push(t_k);
			t_k=778;
			arrayx.push(t_k);
			t_k=318;
			arrayx.push(t_k);
			t_k=358;
			arrayx.push(t_k);
			t_k=478;
			arrayx.push(t_k);
			t_k=848;
			arrayx.push(t_k);
			t_k=928;
			arrayx.push(t_k);//wall position
			
			t_k=110;
			arrayy.push(t_k);
			
			t_k=208;
			arrayy.push(t_k);
			t_k=325;
			arrayy.push(t_k);
			t_k=318;
			arrayy.push(t_k);
			t_k=488;
			arrayy.push(t_k);
			
			t_k=60;
			arrayy.push(t_k);
			t_k=450;
			arrayy.push(t_k);
			t_k=60;
			arrayy.push(t_k);
			t_k=265;
			arrayy.push(t_k);
			t_k=378;
			arrayy.push(t_k);
			t_k=308;
			arrayy.push(t_k);
			t_k=190;
			arrayy.push(t_k);
			t_k=245;
			arrayy.push(t_k);
			t_k=428;
			arrayy.push(t_k);
			t_k=408;
			arrayy.push(t_k);
			t_k=0;
		}



		public  function dosth(e:MouseEvent){
			xx=0;
			yy=0;
			x_s=0;
			y_s=0;
			if(e.target as nextlv){
				iniAre2();
				
			}
			if(e.target as play_but){
				if(are.level==1)
				iniAre();
				else
				iniAre2();
			}
			else if(e.target as tuto_but){
				v.p_button.x=542;
				v.p_button.y=520;
				v.setTuto();
				
			}
			else if(e.target as enemy||e.target as boss ){
				bul_number-=1;
				
				are.nu.update(bul_number);
				xx=e.stageX;
			    yy=e.stageY;
				for each(var bu:bullet in are.array_bul){
					if(bu.useful==true){
						bu.rotation=Math.atan(Math.abs(xx-are.your_tank1.x)/Math.abs(yy-are.your_tank1.y))*180/Math.PI;
						bu.speedx=20*((xx-are.your_tank1.x)/Math.abs(yy-are.your_tank1.y+xx-are.your_tank1.x));
						bu.speedy=20*((yy-are.your_tank1.y)/Math.abs((yy-are.your_tank1.y)+(xx-are.your_tank1.x)));
						bu.useful=false;
						bu.x=are.your_tank1.x;
						bu.y=are.your_tank1.y;
						break;
					}
				}
				if(bul_number<0){
					
					
				}else{
				are.upgrade(3);}
			}
			else{
				xx=e.stageX;
			    yy=e.stageY;
				hitted=false;
				if(are.your_tank1.x<xx){
					x_s=10;
				}else{
					x_s=-10;
				}
				if(are.your_tank1.y<yy){
					y_s=10;
				}
				else{
					y_s=-10;
				   
				}
			
				
			
			}
			
		}
		public  function getcon(vi:view_t):void{
			v=vi;
		}
		public function getAre(a:Arena){
			are=a;
		}
		
		public function iniAre(){
			if(are.replay==1){
				are.LV1();
				
			}
			are.lv_s.pctText.text="LEVEL : 1";
			bul_number=20;
			are.nu.sc=20;
			are.sc.sc=0;
			killnumber=0;
			are.nu.update(bul_number);
			var k,t:int;
			for each(var en:enemy in are.array_enemy){
				k=Math.round(Math.random()*180);
				en.x=arrayx[t_k];
				en.y=arrayy[t_k++];
				if(k<45)
				en.rotation=0;
				if(k>=45 &&k<90)
				en.rotation=90;
				if(k>90)
				en.rotation=180;
			}
			are.your_tank1.x=562;
			are.your_tank1.y=520;
			for each(var wa:wall in are.array_wall){
				t=0;
				wa.x=arrayx[t_k];
				wa.y=arrayy[t_k++];
				
			}
			t_k=0;
			are.upgrade(1);
			timer=new Timer(100);
			timer.addEventListener(TimerEvent.TIMER,upcon);
			timer.start();
		}
		public function iniAre2(){
			bul_number=20;
			are.LV2();
			are.lv_s.pctText.text="LEVEL : 2";
			are.sc.sc=0;
			are.nu.sc=20;
			are.nu.update(bul_number);
			killnumber=0;
			var k,t:int;
			for each(var en:enemy in are.array_enemy){
				k=Math.round(Math.random()*180);
				en.x=arrayx[t_k];
				en.y=arrayy[t_k++];
				if(k<45)
				en.rotation=0;
				if(k>=45 &&k<90)
				en.rotation=90;
				if(k>90)
				en.rotation=180;
			}
			
			are.your_tank1.x=562;
			are.your_tank1.y=520;
			for each(var wa:wall in are.array_wall){
				t=0;
				wa.x=arrayx[t_k];
				wa.y=arrayy[t_k++];
				
			}
			for each(var b:boss in are.array_boss){
				k=Math.round(Math.random()*180);
				b.x=arrayx[t_k];
				b.y=arrayy[t_k++];
				if(k<45)
				b.rotation=0;
				if(k>=45 &&k<90)
				b.rotation=90;
				if(k>90)
				b.rotation=180;
				
			}
			t_k=0;
			are.upgrade(2);
			timer=new Timer(100);
			timer.addEventListener(TimerEvent.TIMER,upcon);
			timer.start();
		}
		public function gameover(){
			timer.stop();
			
			are.upgrade(4);
			for (kk=0;kk<5;kk++){
				are.array_enemy.shift();
			}
			for (kk=0;kk<10;kk++){
				are.array_wall.shift();
				}
			for (kk=0;kk<5;kk++){
				are.array_boss.shift();
			}
			
			
		}
		public function upcon(e:Event){
			are.sc.pctText.text="Your Score is"+are.sc.sc;
			var k:int;
			if(bul_number<0){
			bul_number=20;
			are.sc.pctText.text="Your Score is"+are.sc.sc;
					gameover();}
			if(killnumber>=5){
				gameover();
				
			}
			for each(var en:enemy in are.array_enemy){
				en.go();
				for each(var wa:wall in are.array_wall){
					if(wa.hitTestObject(en)){
						en.rotation=en.rotation+180;
					}
				}
				if(en.hitTestObject(are.your_tank1) && en.power==true){
					gameover();
				}
			}
			for each(var b:boss in are.array_boss){
				b.go();
				for each(var wa:wall in are.array_wall){
					if(wa.hitTestObject(b)){
						b.rotation=b.rotation+180;
					}
				}
				if(b.hitTestObject(are.your_tank1) && b.power==true){
					gameover();
				}
			}
			
			for each(var bu:bullet in are.array_bul){
				if(bu.useful==false && bu.addable==false){
					bu.x=bu.x+bu.speedx;
					bu.y=bu.y+bu.speedy;
					for each(var wa:wall in are.array_wall){
					
					if(wa.hitTestObject(bu)){
						bu.power=false;
						bu.visible=false;
					}
					for each(var en:enemy in are.array_enemy){
						if(en.hitTestObject(bu) && en.power==true && bu.power==true){
							bu.power=false;
						bu.visible=false;
						en.visible=false;
						en.power=false;
						are.sc.sc+=100;
						are.sc.pctText.text="Your Score is"+are.sc.sc;
						killnumber++;
						}
					}
					for each(var b:boss in are.array_boss){
						if(b.hitTestObject(bu) && b.power==true && bu.power==true){
							bu.power=false;
						bu.visible=false;
						b.health--;
						if(b.health<=0){
						b.visible=false;
						b.power=false;
						are.sc.sc+=1000;
						are.sc.pctText.text="Your Score is"+are.sc.sc;
						killnumber++;
						}
						}
					}
				}
				}
			
			
			}
			
			
			
			if(x_s<0 &&y_s<0){
				are.your_tank1.x=are.your_tank1.x+x_s;
				are.your_tank1.rotation=-90;
				if(are.your_tank1.x<=xx)
				 x_s=0;
			}
			else if(x_s==0 && y_s<0){
				are.your_tank1.y=are.your_tank1.y+y_s;
				are.your_tank1.rotation=0;
				if(are.your_tank1.y<=yy)
				 y_s=0;
			}
			else if(x_s>0 &&y_s<0){
				are.your_tank1.x=are.your_tank1.x+x_s;
				are.your_tank1.rotation=90;
				if(are.your_tank1.x>=xx)
				 x_s=0;
			}
			else if(x_s<0 &&y_s>0){
				are.your_tank1.x=are.your_tank1.x+x_s;
				are.your_tank1.rotation=-90;
				if(are.your_tank1.x<=xx)
				 x_s=0;
			}
			else if(x_s==0 && y_s>0){
				are.your_tank1.y=are.your_tank1.y+y_s;
				are.your_tank1.rotation=180;
				if(are.your_tank1.y>=yy)
				 y_s=0;
			}
			else if(x_s>0 &&y_s>0){
				are.your_tank1.x=are.your_tank1.x+x_s;
				are.your_tank1.rotation=-90;
				if(are.your_tank1.x>=xx)
				 x_s=0;
			}
			else if(x_s==0 && y_s>0){
				are.your_tank1.y=are.your_tank1.y+y_s;
				are.your_tank1.rotation=180;
				if(are.your_tank1.y>=yy)
				 y_s=0;
			}
			for each(var wa:wall in are.array_wall){
				if(wa.hitTestObject(are.your_tank1)){
						if(hitted==false){
							if(x_s>0){
								are.your_tank1.x=are.your_tank1.x-7;
							}else
							{
								are.your_tank1.x=are.your_tank1.x+7;
							}
							if(y_s>0){
								are.your_tank1.y=are.your_tank1.y-7;
							}else
							{
								are.your_tank1.y=are.your_tank1.y+7;
							}
						x_s=0;
						y_s=0;
						hitted=true;
						}
					}
			
			}
		}
	}
	
}
