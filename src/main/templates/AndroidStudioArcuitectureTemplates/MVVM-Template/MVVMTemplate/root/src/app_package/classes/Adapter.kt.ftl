package ${packageName}

import android.content.Context
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import kotlinx.android.synthetic.main.cell_${activityLayoutName}_layout.view.*

class ${className}Adapter(val context: Context, val viewModel: ${className}ViewModelPaginated) : RecyclerView.Adapter<RecyclerView.ViewHolder>() {

    var ${classNameLowercase}List: Array<${className}> = arrayOf()
        set(value) {
            field = value
            notifyDataSetChanged()
        }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.cell_${activityLayoutName}_layout, parent, false)
        return ViewHolder(view)
    }

    override fun getItemCount(): Int = ${classNameLowercase}List.size

    override fun onBindViewHolder(holder: RecyclerView.ViewHolder, position: Int) {
        val ${classNameLowercase}: ${className} = ${classNameLowercase}List[position]
        (holder as ViewHolder).bindTo(${classNameLowercase})
    }

    internal inner class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        init {
            view.${classNameLowercase}DeleteButton.setOnClickListener {
                viewModel.delete(${classNameLowercase}List[adapterPosition])
                notifyDataSetChanged()
            }
        }

        fun bindTo(${classNameLowercase}: ${className}) {
            itemView.${classNameLowercase}TextView.text = ${classNameLowercase}.name
            viewModel.getNextPage(adapterPosition)
        }
    }
}