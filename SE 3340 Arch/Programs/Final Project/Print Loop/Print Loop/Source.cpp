// CS 3340
// Date
// Homework #
// Program Name
// Desc

#include <iostream>
#include <iostream>
#include <fstream>
#include <string>
#include <iomanip>


using namespace std;



int main()
{
   ofstream myfile;
   myfile.open("example.txt");
   myfile << "Writing this to a file.\n";
   

   for (int m = 0; m < 64; m++)
   {

      myfile << "func" << m << "_string:" << endl;
      myfile << "        .asciiz \"" << endl;
   }

   for (int m = 0; m < 64; m++)
   {

      myfile << "function";

      myfile << m;



      cout << endl;
      myfile << ":";
      myfile << endl;
      myfile << "        j func" << m << endl;
   }

   for (int m = 0; m < 64; m++)
   {

      myfile << "func";

      myfile << m;



      cout << endl;
      myfile << ":";
      myfile << endl;
      myfile << "#load $a1 for fputs" << endl;
      myfile << "    	move    $v0,$s6                 # set the file descriptor for fput prologue" << endl;
      myfile << "    	la      $a1,func" << m << "_string" << endl;
      myfile << "    	jr $ra" << endl;
   }






   for (int m = 0; m < 64; m++)
   {

      myfile << "opcode" << m << "_string:" << endl;
      myfile << "        .asciiz" << endl;
   }

   for (int m = 0; m < 64; m++)
   {

      myfile << "label";

         myfile << m;
         
         

      cout << endl;
      myfile << ":";
      myfile << endl;
      myfile << "        j opcode" << m << endl;
   }

   for (int m = 0; m < 64; m++)
   {

      myfile << "opcode";

      myfile << m;



      cout << endl;
      myfile << ":";
      myfile << endl;
      myfile << "        ###this happens for any opcode above, write specific string and blankspace" << endl;
      myfile << "        jal owrite" << endl;
      myfile << "    	move    $v0,$s6                 # set the file descriptor for fput prologue" << endl;
      myfile << "    	la      $a1,opcode" << m << "_string" << endl;
      myfile << "    	jal     fputs" << endl;
      myfile << "    	move    $v0,$s6                 # set the file descriptor for fput prologue" << endl;
      myfile << "    	la      $a1,blankspace" << endl;
      myfile << "    	jal     fputs" << endl;
      myfile << "    	move    $v0,$s6                 # set the file descriptor for fput prologue" << endl;
      myfile << "    	jal     oclose" << endl;
      myfile << "    	j       rtype" << endl;

   }

   for (int m = 0; m < 32; m++)
   {

      myfile << "r" << m << "_string:" << endl;
      myfile << "        .asciiz" << endl; 
   }

for (int m = 0; m < 32; m++)
{

   myfile << "register";

   myfile << m;



   cout << endl;
   myfile << ":";
   myfile << endl;
   myfile << "        j r" << m << endl;
}

for (int m = 0; m < 32; m++)
{

   myfile << "r";

   myfile << m;



   cout << endl;
   myfile << ":";
   myfile << endl;
   myfile << "#load $a1 for fputs" << endl;
   myfile << "    	move    $v0,$s6                 # set the file descriptor for fput prologue" << endl;
   myfile << "    	la      $a1,r" << m << "_string" << endl;
   myfile << "    	jr $ra" << endl;
}

myfile.close();
system("pause");                                                                          // pause before closing
return 0;
}

