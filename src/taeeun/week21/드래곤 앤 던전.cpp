#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;
struct info {
	long long t, a, h;
	//t가 1일경우 a: 몬스터 공격력 h: 몬스터 생명력
	//t가 2일 경우 a: 공격력 증가, h: 생명력 회복
};

bool fight(long long attack, long long hp,vector<info>& dragon) {
	long long curHp = hp;
	for (int i = 0; i < dragon.size(); i++) {
		int t = dragon[i].t;
		if (t == 1) {
			long long monsterAttack = dragon[i].a;
			long long monsterHp = dragon[i].h;
			long long attackCnt = monsterHp / attack;
			if (monsterHp % attack) attackCnt++;
			curHp -= monsterAttack * (attackCnt - 1);
			if (curHp <= 0) return false;
		}
		else if (t == 2) {
			long long attackRecover= dragon[i].a;
			long long hpRecover = dragon[i].h;
			curHp=min(hp, curHp+ hpRecover);
			attack += attackRecover;
		}

	}
	return true;
}

int main() {
	long long n, attack; //방의 개수, 초기 공격력
	cin >> n >> attack;
	vector<info> dragon(n);
	for (int i = 0; i < n; i++) {
		int t, a, h;
		cin >> t >> a >> h;
		dragon[i] = { t, a, h };
	}
	long long left = 1;
	long long right = 1e18;
	long long answer = 1e18;
	while (left <= right) {
		long long mid = (left + right) / 2;
		if (fight(attack, mid, dragon)) {
			right = mid - 1;
			answer = min(answer, mid);
		}
		else {
			left = mid + 1;
		}
	}
	cout << answer;
}