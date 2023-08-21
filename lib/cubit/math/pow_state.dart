class PowState{
  int a;
  int b;
  int answer;

  PowState({this.a = 1, this.b = 1,this.answer = 1});

  PowState copyWith({int? a, int? b, int? answer}){
    return PowState(
      a: a ?? this.a,
      b: b ?? this.b,
      answer: answer ?? this.answer,
    );
  }

  clearNumbers(){
    a=1;
    b=1;
  }

}