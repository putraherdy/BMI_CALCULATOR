#include<stdio.h>
int main ()
{
	int nrp,height,baby,sex,remove,save,so,children,teenager,repeat,weight,temp=0;
	float selisih,mature,age;
	printf("******************************************************\n");
	printf("*       Welcome To BMI Calculator Of ILKOM IPB       *\n");
	printf("*                     Written by                     *\n");
	printf("***************                        ***************\n");
	printf("*  Boy Sandi  *                        *  Herdy Dwi  *\n");
	printf("*  G64154052  *                        *  G64154014  *\n");
	printf("******************************************************\n");
	printf("\n");	
	printf("\n");
		
		printf("Please Enter Your Last Two Digits NRP :"); 
		scanf("%d",&nrp);
				while(nrp!=0&&nrp<=60)
				{
				if(temp!=nrp)
				{
				printf("Please Enter Your Sex :"); 
				scanf("%d",&sex);
					if(sex==1) //should be male or female, temporary male = 1 and female =2// 						
					{
					printf("Please Enter Your Age :"); 
					scanf("%f",&age);
					printf("\n");
						if(0<=age&&age<=1) //requirement for baby//
						{
						printf("Your Baby is a %d\n", sex);
						printf("Your Baby is %.1f Year Old\n", age);
						printf("Press 1 If Inputs Are Correct or 0 If Inputs Are Incorrect :"); //should be 'C' or 'I', temporary correct = 1 and incorrect = 0//
						scanf("%d",&repeat);
							if(repeat==1) //data is correct, if data is incorrect will return to sex :// 
							{
							baby=((age*6)+4);
							printf("The Ideal Weight of Your Baby is : %d Kg\n\n", baby); //output baby//
							}
						}	
								else if(1<age&&age<=10) //requirement for children// 
								{
								printf("Your Children is a %d\n", sex);
								printf("Your Children is %.1f Years Old\n", age);
								printf("Press 1 If Inputs Are Correct or 0 If Inputs Are False :"); //should be 'C' or 'I', temporary correct = 1 and incorrect = 0//
								scanf("%d",&repeat);
									if(repeat==1)	
									{
									children=((age*2)+8);
									printf("The Ideal Weight of Your Children is : %d Kg\n\n", children); //output children//
									}
								}
										else if(10<age&&age<=20) //teenager requirement//
										{
										printf("Please Enter Your Height in Cm :");
										scanf("%d",&height);
										printf("\n");				
										printf("You Are a %d\n", sex);
										printf("You Are %.1f Years Old\n", age);
										printf("You Are %d Cm Tall\n", height);
										printf("Press 1 If Inputs Are Correct or 0 If Inputs Are Incorrect :"); //should be 'C' or 'I', temporary correct = 1 and incorrect = 0//
										scanf("%d",&repeat);
											if(repeat==1)
											{
											teenager=((height-100)*0.9);
											printf("Your Ideal Weight as a Teenager is : %d Kg\n\n", teenager); //output teenager//
											}
										}
												else if(20<age&&age<=35)
												{
												printf("Please Enter Your Height in Cm :");
												scanf("%d",&height);
												printf("\n");
												printf("Please Enter Your Weight in Kg :");
												scanf("%d",&weight);
												printf("\n");
												printf("You Are a %d\n", sex);
												printf("You Are %.1f Years Old\n", age);
												printf("You Are %d Cm Tall\n", height);
												printf("Your Weight is %d Kg\n", weight);
												printf("Press 1 If Inputs Are Correct or 0 If Inputs Are Incorrect :");
												scanf("%d",&repeat);
													if(repeat==1)
													{
													mature=((weight*10000)/(height*height));
													printf("Your BMI Index is : %.2f\n\n", mature);
														if(mature<18)
														{
														selisih=((18-mature)*((height*height)/10000));
														printf("Sorry You Are To Thin, You Need To Increase Yor Weight : %.2f Kg\n\n", selisih);
														}
															else if(18<=mature&&mature<=25)
															{
															printf("Congratulations Your BMI is Ideal\n\n");
															}
																if(25<mature&&mature<=27)
																{
																selisih=((mature-25)*((height*height)/10000));
																printf("Sorry You Are To Fat, You Need To Decrease Yor Weight : %.2f Kg\n\n", selisih);
																}
																	if(mature>27)
																	{
																	selisih=((mature-25)*((height*height)/10000));
																	printf("Watch Out You Have Possibility Become Obesity\nYou Need To Decrease Yor Weight : %f Kg\nKindly Do Frequently Check Up To Your Doctor\n\n", selisih);
																	}
													}
												}			
					}
					if (sex==2) //should be male or female, temporary male = 1 and female =2// 						
					{
					printf("Please Enter Your Age :"); 
					scanf("%f",&age);
					printf("\n");
						if(0<=age&&age<=1) //requirement for baby//
						{
						printf("Your Baby is a %d\n", sex);
						printf("Your Baby is %.1f Year Old\n", age);
						printf("Press 1 If Inputs Are Correct or 0 If Inputs Are Incorrect :"); //should be 'C' or 'I', temporary correct = 1 and incorrect = 0//
						scanf("%d",&repeat);
							if(repeat==1) //data is correct, if data is incorrect will return to sex :// 
							{
							baby=((age*6)+4);
							printf("The Ideal Weight of Your Baby is : %d Kg\n\n", baby); //output baby//
							}
						}	
								else if(1<age&&age<=10) //requirement for children// 
								{
								printf("Your Children is a %d\n", sex);
								printf("Your Children is %.1f Years Old\n", age);
								printf("Press 1 If Inputs Are Correct or 0 If Inputs Are False :"); //should be 'C' or 'I', temporary correct = 1 and incorrect = 0//
								scanf("%d",&repeat);
									if(repeat==1)	
									{
									children=((age*2)+8);
									printf("The Ideal Weight of Your Children is : %d Kg\n\n", children); //output children//
									}
								}
										else if(10<age&&age<=20) //teenager requirement//
										{
										printf("Please Enter Your Height in Cm :");
										scanf("%d",&height);
										printf("\n");				
										printf("You Are a %d\n", sex);
										printf("You Are %.1f Years Old\n", age);
										printf("You Are %d Cm Tall\n", height);
										printf("Press 1 If Inputs Are Correct or 0 If Inputs Are Incorrect :"); //should be 'C' or 'I', temporary correct = 1 and incorrect = 0//
										scanf("%d",&repeat);
											if(repeat==1)
											{
											teenager=((height-100)*0.9);
											printf("Your Ideal Weight as a Teenager is : %d Kg\n\n", teenager); //output teenager//
											}
										}
												else if(20<age&&age<=35)
												{
												printf("Please Enter Your Height in Cm :");
												scanf("%d",&height);
												printf("\n");
												printf("Please Enter Your Weight :");
												scanf("%d",&weight);
												printf("\n");
												printf("You Are a %d\n", sex);
												printf("You Are %.1f Years Old\n", age);
												printf("You Are %d Cm Tall\n", height);
												printf("Your Weight is %d Kg\n", weight);
												printf("Press 1 If Inputs Are Correct or 0 If Inputs Are Incorrect :"); //should be 'C' or 'I', temporary correct = 1 and incorrect = 0//
												scanf("%d",&repeat);
													if(repeat==1)
													{			
													mature=((weight*10000)/(height*height));
													printf("Your BMI Index is : %.2f\n\n", mature);
														if(mature<17)
														{
														selisih=((17-mature)*((height*height)/10000));
														printf("Sorry You Are To Thin, You Need To Increase Yor Weight : %.2f Kg\n\n", selisih);
														}
															if(17<=mature&&mature<=23)
															{
															printf("Congratulations Your BMI is Ideal\n\n");
															}
																if(23<mature&&mature<=27)
																{
																selisih=((mature-23)*((height*height)/10000));
																printf("Sorry You Are To Fat, You Need To Decrease Yor Weight : %.2f Kg\n\n", selisih);
																}
																	if(mature>27)
																	{
																	selisih=((mature-23)*((height*height)/10000));
																	printf("Watch Out You Have Possibility Become Obesity\nYou Need To Decrease Yor Weight : %f Kg\nKindly Do Frequently Check Up To Your Doctor\n\n", selisih);
																	}
													}
												}
					}
					if(repeat==1)
					{														
					printf("Would You Like To Save Your Data? :"); //should be yes or no, temporary yes = 1 and no = 0//
					scanf("%d",&save);
					printf("\n");
						if(save==1) //save//
						{
						temp=nrp;
						}
							printf("Please Enter Your Last Two Digits NRP :");
		        			scanf("%d",&nrp);
		       				printf("\n");
					}
					}
							if(temp==nrp)
							{
							printf("Sorry You Have Entered Your Data Previously!!!\n\nPlease Press 1 To Remove Your Previous Data :"); //when data have been saved//	
							scanf("%d",&remove);
							printf("\n");
								if(remove==1)
								{
								temp=0;
								}
									else
									{
									printf("============Thank You For Using Our BMI Calculator============");	
									nrp=0;
									}
							}
				}
return 0;
}

