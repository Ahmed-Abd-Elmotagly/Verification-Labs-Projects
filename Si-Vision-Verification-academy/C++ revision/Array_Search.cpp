//search for item in array
#include <iostream>
#include <stdint.h>
#include <string.h>
using namespace std;

int search (const int arr[],int size,int item);

int main () {
    cout << "enter item to search in database " << "\n";
    int database [5] = {4,8,9,5,7};
    int look;
    cin >> look;
    search (database,5,look);
}

int search (const int arr[],int size,int item) {
    for (int i=0;i<size;i++){
        if (arr[i]==item) 
        { 
            cout << "found the item in index " << i << "\n";
            return i;
        } 
        else continue;
    }
}
