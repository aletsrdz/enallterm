<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\FichaTerminologica;

/**
 * FichaTerminologicaSearch represents the model behind the search form of `app\models\FichaTerminologica`.
 */
class FichaTerminologicaSearch extends FichaTerminologica
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'area_id', 'subarea_id', 'pais_id'], 'integer'],
            [['temino_origen', 'termino_meta', 'definicion_origen', 'definicion_meta', 'fuente_origen', 'fuente_meta', 'contexto_origen', 'contexto_meta', 'no_recomendado', 'notas_fichat', 'url_imagen', 'url_video', 'url_sonido', 'create_at', 'update_at'], 'safe'],
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
        $query = FichaTerminologica::find();

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
            'area_id' => $this->area_id,
            'subarea_id' => $this->subarea_id,
            'pais_id' => $this->pais_id,
            'create_at' => $this->create_at,
            'update_at' => $this->update_at,
        ]);

        $query->andFilterWhere(['ilike', 'temino_origen', $this->temino_origen])
            ->andFilterWhere(['ilike', 'termino_meta', $this->termino_meta])
            ->andFilterWhere(['ilike', 'definicion_origen', $this->definicion_origen])
            ->andFilterWhere(['ilike', 'definicion_meta', $this->definicion_meta])
            ->andFilterWhere(['ilike', 'fuente_origen', $this->fuente_origen])
            ->andFilterWhere(['ilike', 'fuente_meta', $this->fuente_meta])
            ->andFilterWhere(['ilike', 'contexto_origen', $this->contexto_origen])
            ->andFilterWhere(['ilike', 'contexto_meta', $this->contexto_meta])
            ->andFilterWhere(['ilike', 'no_recomendado', $this->no_recomendado])
            ->andFilterWhere(['ilike', 'notas_fichat', $this->notas_fichat])
            ->andFilterWhere(['ilike', 'url_imagen', $this->url_imagen])
            ->andFilterWhere(['ilike', 'url_video', $this->url_video])
            ->andFilterWhere(['ilike', 'url_sonido', $this->url_sonido]);

        return $dataProvider;
    }
}
