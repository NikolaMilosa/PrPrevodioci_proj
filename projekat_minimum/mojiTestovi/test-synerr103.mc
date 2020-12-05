//Testiranje sintaksnih gresaka kod check iskaza

int main(){

	int a,b,c;
	unsigned e,f,g;
	
	check [a]{ 
		otherwise ->                  //otherwise pre when
			 = a + b;                    
		when 1 ->
			a = a + 5;
			finish;
		when 5 ->
			{
				b = 3;
			}
		}
		
	return 0;
	
}
