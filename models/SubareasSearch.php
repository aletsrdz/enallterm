<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Subareas;

/**
 * SubareasSearch represents the model behind the search form of `app\models\Subareas`.
 */
class SubareasSearch extends Subareas
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'areas_id'], 'integer'],
            [['nombre'], 'safe'],
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
        $query = Subareas::find();

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
            'areas_id' => $this->areas_id,
        ]);

        $query->andFilterWhere(['ilike', 'nombre', $this->nombre]);

        return $dataProvider;
    }
}
