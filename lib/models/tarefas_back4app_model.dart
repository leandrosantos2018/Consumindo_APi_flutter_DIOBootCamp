class TarefasBack4AppModel {
  List<TarefaBack4AppModel> tarefas = [];

  TarefasBack4AppModel( this.tarefas);

  TarefasBack4AppModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      tarefas = <TarefaBack4AppModel>[];
      json['results'].forEach((v) {
        tarefas.add(TarefaBack4AppModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (tarefas != null) {
      data['results'] = tarefas.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TarefaBack4AppModel {
  String objectId = "";
  String descricao = "";
  bool concluindo = false;
  String createdAt = "";
  String updatedAt = "";

  TarefaBack4AppModel();

  TarefaBack4AppModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    descricao = json['descricao'];
    concluindo = json['concluindo'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['descricao'] = descricao;
    data['concluindo'] = concluindo;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
