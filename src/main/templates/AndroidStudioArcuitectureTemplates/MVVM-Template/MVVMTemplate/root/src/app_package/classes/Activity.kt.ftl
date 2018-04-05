package ${packageName}

import android.arch.lifecycle.Observer
import android.content.Context
import android.content.Intent
import android.support.v7.widget.LinearLayoutManager
import android.widget.Toast
import kotlinx.android.synthetic.main.${activityLayoutName}_layout.*

class ${className}Activity : BaseActivity<${className}ViewModelPaginated>() {

    override val layoutId: Int
        get() = R.layout.${activityLayoutName}_layout

    override fun setUpViews() {
        ${classNameLowercase}SwipeLayout.isEnabled = false
        ${classNameLowercase}SwipeLayout.setOnRefreshListener { viewModel.reload() }

        titleTextView.text = viewModel.title

        val adapter = ${className}Adapter(this, viewModel)
        ${classNameLowercase}RecyclerView.layoutManager = LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false)
        ${classNameLowercase}RecyclerView.adapter = adapter

        viewModel.get${className}().observe(this, Observer<Resource<Array<${className}>>> {
            adapter.${classNameLowercase}List = it?.data ?: arrayOf()

            if (it?.status == Resource.Status.LOADING) {
                if (adapter.itemCount == 0) {
                    ${classNameLowercase}LoadingView.visibility = View.VISIBLE
                } else {
                    ${classNameLowercase}SwipeLayout.isRefreshing = true
                }
            } else {
                ${classNameLowercase}SwipeLayout.isEnabled = true
                if (${classNameLowercase}SwipeLayout.isRefreshing) ${classNameLowercase}SwipeLayout.isRefreshing = false
                ${classNameLowercase}LoadingView.visibility = View.INVISIBLE

                if (it?.status == Resource.Status.ERROR) {
                    Toast.makeText(this, it.errorMessage, Toast.LENGTH_LONG).show()
                }
            }
        })

        //${classNameLowercase}LoadingView.visibility = if (viewModel.get${className}().value?.data?.size == 0) View.VISIBLE else View.INVISIBLE

        inputButton.setOnClickListener {
            viewModel.add(editText.text.toString())
            editText.setText("")
        }
    }

    companion object {
        const val KEY_TITLE = "title"

        fun createIntent(context: Context, title: String): Intent {
            val intent = Intent(context, ${className}Activity::class.java)
            intent.putExtra(KEY_TITLE, title)
            return intent
        }
    }
}
