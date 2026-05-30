/*
  revision on c++
  program to ask user to enter 10 employee salaries and store them , then add 10% bonus for each employee and print the average 
*/

#include <iostream>
#include <stdint.h>
#include <string.h>
using namespace std;

int main () {
    float base [10];
    float bonus[10];
    float sum = 0;
    for (int i=0; i<10; i++) {
        cout << "Enter employee salary number " << i+1 <<"\n";
        cin >> base[i];
        bonus[i] = base[i]*1.1;
        sum += bonus[i];
    }
    cout << "average after added bonus is " << sum/10;

}
