<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Autor;

/**
 * AutorSearch represents the model behind the search form of `app\models\Autor`.
 */
class AutorSearch extends Autor
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'ficha_terminologica_id', 'user_id', 'inscrito_id'], 'integer'],
            [['nombre', 'apaterno', 'amaterno'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Autor::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'ficha_terminologica_id' => $this->ficha_terminologica_id,
            'user_id' => $this->user_id,
            'inscrito_id' => $this->inscrito_id,
        ]);

        $query->andFilterWhere(['ilike', 'nombre', $this->nombre])
            ->andFilterWhere(['ilike', 'apaterno', $this->apaterno])
            ->andFilterWhere(['ilike', 'amaterno', $this->amaterno]);

        return $dataProvider;
    }
}
