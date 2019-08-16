class Qr {
    
  int id;
  String tipo;
  String valor;

  Qr({
      this.id,
      this.tipo,
      this.valor,
  }){
    if(this.valor.contains('http')){
      this.tipo = 'http';
    }
    else{
      this.tipo = 'geo';
    }
  }

  factory Qr.fromJson(Map<String, dynamic> json) => new Qr(
      id: json["id"],
      tipo: json["tipo"],
      valor: json["valor"],
  );

  Map<String, dynamic> toJson() => {
      "id": id,
      "tipo": tipo,
      "valor": valor,
  };

}
