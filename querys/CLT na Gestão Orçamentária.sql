select * from prep.rateio_folha_celula rfc

select 
	f.valor_lancamento,
	f.historico ,	
	concat(
		f.id_setor_custo_lancado,'-', 
		f.id_subsetor_custo_lancado,'-',
		f.id_celula_custo_lancado,'-',
		f.id_base1_custo_lancado,'-',
		f.id_base2_custo_lancado) as "id_projeto",
	f.id_filial,
	f.id_fornecedor, 
	f.id_recibo_lancamento,
	f.id_conta_financeiro,
	f.valor_pago,
	f.id_setor_custo_lancado,
	f.id_subsetor_custo_lancado,
	f.id_celula_custo_lancado,
	f.id_base1_custo_lancado,
	f.id_base2_custo_lancado,
	f.nome_funcionario_lancamento,
	f.data_lancamento_financeiro,
	f.data_competencia_lancamento,
	f.data_compensacao_lancamento,
	f2.nome_conta_financeiro,
	f2.nome_fornecedor,
	f3.id_centro_de_custos,
	f4.classificacao_centro_de_custos 
from se_operacao.fat_tb_lancamentos_financeiros f
left join se_operacao.fat_tb_financeiro f2 on f2.id_recibo_lancamento  = f.id_recibo_lancamento
left join se_operacao.fat_tb_rateio_centro_de_custos f3 on f3.id_recibo_lancamento = f.id_recibo_lancamento 
left join se_operacao.dim_tb_centro_de_custos f4 on f4.id_centro_de_custos = f3.id_centro_de_custos 
left join se_operacao.dim_tb_fornecedor f5 on f5.id_fornecedor = f.id_fornecedor 
where 1=1
and f.historico  like '%TEC%'
--and lower(f.historico)  like '%adiantamento%'
--and lower(f.historico)  like '%salário%'
and f.id_setor_custo_lancado is not null
--and lower(historico)  like '%fornecedor%'
--and f.valor_pago  = 10000

select 
	f.valor_lancamento,
	f.historico ,	
	concat(
		f.id_setor_custo_lancado, '-', 
		f.id_subsetor_custo_lancado, '-',
		f.id_celula_custo_lancado, '-',
		f.id_base1_custo_lancado, '-',
		f.id_base2_custo_lancado) as "id_projeto",
	f.id_filial,
	f.id_fornecedor, 
	f.id_recibo_lancamento,
	f.id_conta_financeiro,
	f.valor_pago,
	f.id_setor_custo_lancado,
	f.id_subsetor_custo_lancado,
	f.id_celula_custo_lancado,
	f.id_base1_custo_lancado,
	f.id_base2_custo_lancado,
	f.nome_funcionario_lancamento,
	f.data_lancamento_financeiro,
	f.data_competencia_lancamento,
	f.data_compensacao_lancamento,
	f2.nome_conta_financeiro,
	f2.nome_fornecedor,
	f3.id_centro_de_custos,
	f4.classificacao_centro_de_custos
from
	se_operacao.fat_tb_lancamentos_financeiros f
left join se_operacao.fat_tb_financeiro f2 on
	f2.id_recibo_lancamento = f.id_recibo_lancamento
left join se_operacao.fat_tb_rateio_centro_de_custos f3 on
	f3.id_recibo_lancamento = f.id_recibo_lancamento
left join se_operacao.dim_tb_centro_de_custos f4 on
	f4.id_centro_de_custos = f3.id_centro_de_custos
left join se_operacao.dim_tb_fornecedor f5 on
	f5.id_fornecedor = f.id_fornecedor
where
		(f.nome_funcionario_lancamento like '%TECNOLOGIA%'
		and f.id_setor_custo_lancado is not null)
	or(
		 LOWER(f.historico) like '%tec%'
			and LOWER(f.historico) not like '%eng%'
			and (f.id_conta_financeiro = '200020'
				or f.id_conta_financeiro = '300005')
			and (f.id_fornecedor = '6'
				or f.id_fornecedor = '5075')
		)
	--and f2.tipo_lancamento 