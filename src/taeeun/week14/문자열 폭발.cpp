#include <iostream>
#include <vector>
#include <algorithm>
#include <string>

using namespace std;

int main() {
	string str;
	string explode;
	cin >> str >> explode;
	vector<char> answer;
	for (int i = 0; i < str.length(); i++) {
		answer.push_back(str[i]);
		if (str[i] == explode.back()) {
			if (answer.size() < explode.length()) continue;
			bool flag = true;
			for (int j = explode.length() - 2; j >= 0; j--) {
				if (answer[answer.size()-(explode.length()-1-j)-1] != explode[j]) {
					flag = false;
					break;
				}
			}
			if (flag) {
				for (int k = 0; k < explode.length(); k++) {
					answer.pop_back();
				}
			}
		}
	}
	if (answer.size() == 0) cout << "FRULA";
	else {
		for (auto iter : answer) {
			cout << iter;
		}
	}

}
