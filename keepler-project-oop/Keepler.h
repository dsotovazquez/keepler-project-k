#include <iostream>
#define KEEPLER_EMP_NUM 110

using namespace std;

class Manifest {
  private:
    string manifest;
  public:
    string getManifest()                   { return manifest; }
    void   seManifest(string newManifest)  { manifest = newManifest; }
    void show() {
      cout << getManifest() <<endl;
    }
};
