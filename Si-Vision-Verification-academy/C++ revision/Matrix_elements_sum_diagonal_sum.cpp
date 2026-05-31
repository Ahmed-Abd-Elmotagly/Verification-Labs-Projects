// enter a matrix to store and calculate all elements sum and diagonal sum 
#include <iostream>
#include <stdint.h>
#include <string.h>
using namespace std;

float matrix (float *elements,int rows,int cols);
   
   int main() {
        cout << "enter matrix number of rows" << "\n" ;
        int rows,cols;
        cin >> rows;
        cout << "enter matrix number of columns" << "\n" ;
        cin >> cols;
        float items [rows][cols];
        cout << "enter elements, fill row then move to next" << "\n" ;
        
        for (int i=0; i<rows;i++) {
            for (int j=0; j<cols;j++) {
            cin >> items[i][j];
            }
        }

        matrix ((float*)items,rows,cols);
    }

   float matrix (float *elements,int rows,int cols) {
    
    float sum = 0,diagonal = 0;
    for (int i=0; i<rows;i++) {
        for (int j=0; j<cols;j++) {
            sum += elements[i*cols+j];
            if (i==j) {
                diagonal += elements[i*cols+j];
            }
        }
    }
    cout << "sum of all elements is " << sum << "\n";
    cout << "sum of diagonal elements is " << diagonal << "\n";

   }
