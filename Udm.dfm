object dm: Tdm
  OldCreateOrder = False
  Height = 454
  Width = 630
  object cdsProdtuos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 153
    Top = 34
    object cdsProdtuosid: TIntegerField
      FieldName = 'id'
    end
    object cdsProdtuosNome: TStringField
      FieldName = 'Nome'
      Size = 100
    end
    object cdsProdtuossimilar_id: TIntegerField
      FieldName = 'similar_id'
    end
  end
  object dsProdutos: TDataSource
    DataSet = cdsProdtuos
    Left = 57
    Top = 34
  end
  object dsSimilar: TDataSource
    DataSet = cdsSimilar
    Left = 57
    Top = 138
  end
  object cdsSimilar: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 153
    Top = 138
    object cdsSimilarid_similar: TIntegerField
      FieldName = 'id_similar'
    end
    object cdsSimilarNome_Similar: TStringField
      FieldName = 'Nome_Similar'
      Size = 100
    end
  end
  object dsProdutoSimilar: TDataSource
    DataSet = cdsProdutoSimilar
    Left = 65
    Top = 226
  end
  object cdsProdutoSimilar: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 161
    Top = 226
    object cdsProdutoSimilarid: TIntegerField
      FieldName = 'id'
    end
    object cdsProdutoSimilarNome: TStringField
      FieldName = 'Nome'
      Size = 100
    end
    object cdsProdutoSimilarsimilar_id: TIntegerField
      FieldName = 'similar_id'
    end
  end
end
